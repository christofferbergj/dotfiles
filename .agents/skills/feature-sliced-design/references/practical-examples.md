# Practical Examples

Concrete code patterns for common scenarios within FSD structure. Covers
authentication, type definitions, API request handling, and state management
integration (Redux, TanStack Query / React Query).

## Authentication

Auth is one of the most common sources of confusion in FSD. The key question
is: what goes in `shared/`, what goes in `features/` or `pages/`?

### Auth data: `shared/auth/` or `shared/api/`

Tokens, session state, and login utilities are **infrastructure**, not
business logic. Keep them in shared:

```typescript
// shared/auth/token.ts
const TOKEN_KEY = "auth_token";
export const getToken = () => localStorage.getItem(TOKEN_KEY);
export const setToken = (t: string) => localStorage.setItem(TOKEN_KEY, t);
export const clearToken = () => localStorage.removeItem(TOKEN_KEY);

// shared/auth/session.ts
export interface Session { userId: string; email: string; role: "admin" | "user" }
// useSession depends on the auth provider (React Context, Zustand, etc.)
export const useSession = (): Session | null => { /* ... */ };
```

The `shared/auth/index.ts` re-exports from these files following the
standard public API pattern.

### Auth UI: pages (single use) or features (multi-use)

Place the login form in the slice that consumes it. Single-use (only on the
login page) goes in `pages/login/`; multi-use (dedicated page + modal login)
goes in `features/auth/`:

```text
pages/login/                     ← Single-use
  ui/{LoginPage,LoginForm}.tsx
  model/login.ts                 ← Form state, validation
  api/login.ts                   ← POST /auth/login
  index.ts

features/auth/                   ← Multi-use
  ui/{LoginForm,RegisterForm}.tsx
  model/auth.ts
  api/{login,register}.ts
  index.ts
```

### Dialog for login

If you need a login dialog that can be reused across multiple pages, you can
implement it as a **feature** responsible for the login user action and flow.
A login dialog typically includes logic such as form state management, input
validation, authentication requests and error handling. These responsibilities
belong in the `features` layer because they handle user actions and flows.

```text
features/
  login/
    ui/LoginDialog.tsx
    model/
    api/
    index.ts
```

When multiple pages need the login dialog, they can import and use the feature
from each page or from the route configuration in `app`.

A component responsible only for the common dialog UI and basic interactions
can be placed in `shared/ui`. This component should not include login-specific
logic such as authentication requests, input validation or authentication
state management.

The UI and logic required for login should be managed in `features/login`.
When necessary, `LoginDialog` can be implemented by composing the dialog
component from `shared/ui`.

```text
shared/
  ui/
    modal/
      Modal.tsx
      index.ts
features/
  login/
    ui/LoginDialog.tsx
    model/
    api/
    index.ts
```

### When to use shared/auth vs a user entity

The official Auth guide presents two valid storage locations: **In Shared**
(`shared/auth` or `shared/api`) and **In Entities** (a `user` entity).
**In Pages/Widgets** is not recommended.

`shared/auth` is the simpler default. Choose it when the project has no
entities layer yet, or when auth state is just a token plus minimal user info.

A `user` entity is the right call when the project already has an
entities layer **and** auth and profile data are tightly coupled (profile
reused for non-auth purposes like avatars in comments).

```text
// Path A: shared/auth (simpler default)
shared/auth/session.ts         ← userId, email, role, token

// Path B: user entity (entities layer exists, profile reuse is real)
entities/user/
  model/
    current-user.ts            ← Current authenticated user + token
    user.ts                    ← Generic user type
  api/get-current-user.ts
  index.ts
```

For the entity approach, the API client in `shared/api` cannot import from
`entities/`. The official guide describes three solutions: pass the token
manually, expose it through a context with the key kept in `shared/api`,
or inject the token into the API client when the entity store updates.

A `user` entity created **only** to wrap a login response is premature.
See `references/excessive-entities.md` for the full decision matrix.

### In Pages/Widgets (not recommended)

It is not recommended to place the token store in `pages` or in a specific
`features` slice.

Tokens are not state that belongs only to a specific page or a single user
action. They are application-wide state used by multiple authenticated API
requests and user flows.
For example, if the token store is placed in `features/login`, another feature
cannot directly import it. Different feature slices on the same layer should
remain independent from one another.

Similarly, if the token store is placed in `pages`, modules on lower layers
cannot access it. This makes it difficult to reuse the token store in
authenticated API requests or other user flows.
Place the token store in `shared` or in an `entities` slice representing the
current user or session, according to the criteria described above.

### Logout and token invalidation

Most applications do not provide a separate page exclusively for logout.
Instead, logout functionality is made available wherever it is needed, such as
in a header, settings screen, or user menu.

Logout generally consists of the following steps.

1. Send an authenticated logout request to the backend.
   For example, `POST /logout`.
2. Reset the token store.
   Remove both the access token and refresh token.
3. Reset the current user information and authentication state when necessary.
4. Navigate to the login page or another screen when necessary.

The location of the logout request should be determined by the project's API
organization and the scope in which the request is reused.
If all API endpoints are managed in `shared/api`, authentication-related
requests such as login, logout, and token refresh can be placed together.

```text
shared/
  api/
    client.ts
    endpoints/
      login.ts
      logout.ts
      refresh-token.ts
    index.ts
```

If the logout request is used only as part of a specific logout flow, it can
be placed in the `api` segment of `features/logout`.
If logout is reused across multiple screens and represents an independent user
flow that includes token cleanup, user state cleanup, error handling, and
navigation, the flow can be extracted into `features/logout`.

```text
features/
  logout/
    api/logout.ts
    ui/LogoutButton.tsx
    index.ts
```

If logout requires its own state or reusable processing logic, a `model`
segment can be added. There is no need to create unused segments in advance
for a simple logout feature.

`features/logout` coordinates tasks such as sending the logout request and
resetting the token store as a single user flow. The token store itself and
the token management logic should remain in the previously selected location
under `shared` or `entities`.

On the other hand, if the logout logic is simple and used in only one or two
places, it does not necessarily need to be extracted into a separate feature.
It can be composed directly in the page or route configuration where it is
used.

> Slice names should be based on user actions and flows rather than the UI
> location where they are displayed. Therefore, even when logout is triggered
> from a header, `features/logout` is more appropriate than `features/header`
> when the behavior is extracted as an independent user flow.

### Automatic logout

The token store and current user state should be reset when the client's
authentication state can no longer be maintained, such as in the following
cases

- The user requests to log out.
- The refresh token has expired or is invalid, causing the token refresh
  request to be rejected.

If the authentication state is not reset, the UI may appear as though the user
is still logged in while authenticated API requests continue to fail.
Even if the logout request fails, the client can still reset the token store
and current user state. However, the server-side session or refresh token may
not have been invalidated, so the backend authentication policy should also be
taken into account.

> If tokens are managed in an entity representing the current user or session,
> the token reset logic can be placed in the slice's `model` segment. If tokens
> are managed on the Shared layer, they can be separated into a module
> responsible for authentication, such as `shared/auth`.

## Type Definitions

### Where to define types

The location of type definitions follows the same rules as any other code:

| Type scope | Location |
| --- | --- |
| API response/request shapes shared across the app | Domain-named files in `shared/api/` (e.g., `shared/api/product.ts`) |
| Types for a specific entity's domain model | `entities/<name>/model/<name>.ts` |
| Types used only within one page | `pages/<name>/model/<name>.ts` |
| Types used only within one feature | `features/<name>/model/<name>.ts` |
| Generic utility types (e.g., `Nullable<T>`) | Domain-named files in `shared/lib/` (e.g., `shared/lib/nullable.ts`) |

Per Rule 4-4 (domain-based file naming), avoid grouping all types in
`types.ts` or `utils.ts`. A file named `types.ts` cannot answer "types
for what?" without inspection; a file named `product.ts` can.

### Example: API types in shared

```typescript
// shared/api/product.ts: raw API response shapes
export interface ProductDTO {
  id: string;
  name: string;
  price: number;
  category: string;
  createdAt: string;
}
```

### Example: Domain types in entities

```typescript
// entities/product/model/product.ts: domain model layered on top
import type { ProductDTO } from "@/shared/api/product";

export interface Product extends ProductDTO {
  formattedPrice: string;
  isOnSale: boolean;
}

export const fromDTO = (dto: ProductDTO): Product => ({
  ...dto,
  formattedPrice: `$${dto.price.toFixed(2)}`,
  isOnSale: dto.price < 10,
});
```

**Key principle:** Raw API shapes go in `shared/api/`. Domain models with
business logic go in `entities/`. If you only need the raw shape, do not
create an entity just for types.

## API Request Handling

### Basic pattern: API calls in the consuming slice

```typescript
// pages/product-detail/api/fetch-product.ts
import { apiClient } from "@/shared/api/client";
import type { ProductDTO } from "@/shared/api/product";

export const fetchProduct = (id: string): Promise<ProductDTO> =>
  apiClient.get(`/products/${id}`).then((r) => r.data);
```

### Shared API client setup

```typescript
// shared/api/client.ts
import axios from "axios";
import { getToken } from "@/shared/auth/token";

export const apiClient = axios.create({ baseURL: import.meta.env.VITE_API_URL });

apiClient.interceptors.request.use((config) => {
  const token = getToken();
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});
```

### CRUD helpers in shared

```typescript
// shared/api/create-crud-api.ts
import { apiClient } from "./client";

export const createCrudApi = <T>(resource: string) => ({
  getAll: () => apiClient.get<T[]>(`/${resource}`).then((r) => r.data),
  getById: (id: string) => apiClient.get<T>(`/${resource}/${id}`).then((r) => r.data),
  create: (data: Partial<T>) => apiClient.post<T>(`/${resource}`, data).then((r) => r.data),
  update: (id: string, data: Partial<T>) => apiClient.put<T>(`/${resource}/${id}`, data).then((r) => r.data),
  remove: (id: string) => apiClient.delete(`/${resource}/${id}`),
});

// Usage: export const productsApi = createCrudApi<ProductDTO>("products");
```

### Request placement rule

Place each request function in the slice that owns the use case:

- **Page-specific data fetching** (e.g., dashboard stats only used on the
  dashboard) → `pages/<name>/api/`
- **Feature-specific actions** (e.g., `toggleLike`) → `features/<name>/api/`
- **Reusable domain queries** (e.g., `getUserById`) → `entities/<name>/api/`
- **CRUD primitives** for a generic resource → `shared/api/create-crud-api.ts`

Do not put domain-specific request functions in `shared/api/`. Shared is
infrastructure; the moment a function knows about a specific resource and
its domain rules, it belongs in `entities/` or higher.

## State Management: Redux

### Where a Redux slice belongs

The `from-custom` migration guide draws a clean line: **business
entities** (the things your app works with, like `todo`, `product`, `user`)
go in the Entities layer; **user actions** (`add-todo`, `toggle-todo`,
`like-post`) go in Features.

In v2.1, also remember the pages-first rule: if the slice is used by a
single page, keep it in that page's `model/` segment until reuse appears.

### Business-entity slice in entities

```typescript
// entities/todo/model/todo.ts
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { apiClient } from "@/shared/api/client";

interface Todo { id: string; title: string; completed: boolean }
interface TodoState { items: Todo[]; loading: boolean }

export const fetchTodos = createAsyncThunk("todos/fetch", async () =>
  (await apiClient.get<Todo[]>("/todos")).data,
);

const todoSlice = createSlice({
  name: "todos",
  initialState: { items: [], loading: false } as TodoState,
  reducers: {
    setCompleted: (state, { payload }: { payload: { id: string; completed: boolean } }) => {
      const todo = state.items.find((t) => t.id === payload.id);
      if (todo) todo.completed = payload.completed;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchTodos.pending, (state) => { state.loading = true; })
      .addCase(fetchTodos.fulfilled, (state, action) => {
        state.items = action.payload;
        state.loading = false;
      });
  },
});

export const { setCompleted } = todoSlice.actions;
export const selectTodos = (state: RootState) => state.todos.items;
export const todoReducer = todoSlice.reducer;
```

The slice's public API re-exports what consumers need:

```typescript
// entities/todo/index.ts
export { todoReducer, selectTodos, setCompleted, fetchTodos } from "./model/todo";
```

**Key:** The entire Redux slice (reducer + selectors + thunks) lives in a
single domain-named file, not split across `reducers.ts`, `selectors.ts`,
`thunks.ts`. That technical-role split reduces cohesion and is an
anti-pattern in FSD.

### User-action slice in features

A user action that orchestrates the entity exposes a hook through its
public API and consumes the entity's reducer:

```typescript
// features/toggle-todo/model/use-toggle-todo.ts
import { useDispatch } from "react-redux";
import { setCompleted } from "@/entities/todo";

export const useToggleTodo = () => {
  const dispatch = useDispatch();
  return (id: string, current: boolean) =>
    dispatch(setCompleted({ id, completed: !current }));
};
```

### Registering slices in app

```typescript
// app/providers/store.ts
import { configureStore } from "@reduxjs/toolkit";
import { todoReducer } from "@/entities/todo";
import { userReducer } from "@/entities/user";

export const store = configureStore({
  reducer: {
    todos: todoReducer,
    user: userReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
```

The store imports each slice's reducer through its public API
(`index.ts`), never reaching into `model/` directly (Rule 4-2). Do not
let individual slices create their own stores.

## State Management: TanStack Query (React Query)

Guidance applies to `@tanstack/react-query` v5 (formerly React Query). The
package name is `@tanstack/react-query`.

### Where to store query keys

Three placements are valid. Choose based on project size and whether the
project already has an Entities layer.

**Option 1: Flat in `shared/api/queries/`** (small projects, few endpoints):

```text
shared/api/
  queries/
    example.ts
    another-example.ts
  index.ts          ← export { exampleQueries } from './queries/example';
```

**Option 2: Per controller in `shared/api/<controller>/`** (many endpoints):

```text
shared/api/example/
  index.ts          ← export { exampleQueries } from './example.query';
  example.query.ts  ← Query factory: keys + functions
  get-example.ts
  create-example.ts
  update-example.ts
  delete-example.ts
```

**Option 3: Per entity in `entities/<entity>/api/`** when each request
corresponds to a single entity, and the project already has an Entities
layer. When entities reference each other, see
`references/cross-import-patterns.md` for `@x` notation as a last resort.

### Where to store mutations

Do not mix mutations with queries. Two patterns are accepted:

1. **A mutation hook in the `api/` segment near the place of use.** Use
   `setQueryData` for cache updates:

   ```typescript
   // src/pages/example/api/use-update-example.ts
   export const useUpdateExample = () => {
     const queryClient = useQueryClient();
     return useMutation({
       mutationFn: ({ id, newTitle }) => apiClient.patch(`/posts/${id}`, { title: newTitle }).then((r) => r.data),
       onSuccess: (newPost, { id }) => queryClient.setQueryData(POST_QUERIES.detail({ id }).queryKey, newPost),
     });
   };
   ```

2. **A `mutationFn` defined in `shared/` or `entities/`** and called from
   `useMutation` in the component.

### Query factory pattern

A query factory is an object whose values return query keys. Each key is
wrapped in `queryOptions`, a built-in helper from `@tanstack/react-query` v5
that lets you share `queryKey` and `queryFn` between `useQuery`,
`useSuspenseQuery`, `prefetchQuery`, `setQueryData`, and similar APIs
without rewriting them:

```typescript
// src/shared/api/post/post.queries.ts
import { queryOptions } from "@tanstack/react-query";
import { getPosts, getDetailPost, type DetailPostQuery } from "./get-posts";

export const POST_QUERIES = {
  all: () => ["posts"],
  lists: () => [...POST_QUERIES.all(), "list"],
  list: (page: number, limit: number) => queryOptions({
    queryKey: [...POST_QUERIES.lists(), page, limit],
    queryFn: () => getPosts(page, limit),
    placeholderData: (prev) => prev,
  }),
  detail: (query?: DetailPostQuery) => queryOptions({
    queryKey: [...POST_QUERIES.all(), "detail", query?.id],
    queryFn: () => getDetailPost({ id: query?.id }),
  }),
};
```

Consume with `useQuery(POST_QUERIES.detail({ id }))`. For pagination,
`placeholderData: prev => prev` prevents UI flicker when navigating pages.

**Benefits of a query factory:** all API requests for a domain live in one
place (readability), every key and query function is reachable through the
same object (convenient access), and refetching is a one-line call
(`queryClient.invalidateQueries({ queryKey: POST_QUERIES.all() })`) without
hunting down keys across the codebase.

### Infinite scroll

Use `infiniteQueryOptions` with `initialPageParam` and `getNextPageParam`.
Add the infinite key to the same factory shown above:

```typescript
import { infiniteQueryOptions } from "@tanstack/react-query";

// Inside POST_QUERIES:
infinite: (limit: number) => infiniteQueryOptions({
  queryKey: [...POST_QUERIES.lists(), "infinite", limit],
  queryFn: ({ pageParam }) => getPosts(pageParam, limit),
  initialPageParam: 0,
  getNextPageParam: (lastPage) => lastPage.skip + lastPage.limit < lastPage.total ? lastPage.skip / lastPage.limit + 1 : undefined,
}),
```

Consume with `useInfiniteQuery` and flatten via `data?.pages.flatMap(...)`.

### Suspense mode

`queryOptions` and `useSuspenseQuery` are compatible, and the factory does
not change. Components use `useSuspenseQuery` instead of `useQuery` and skip
`isLoading` entirely. Wrap interested subtrees with an `ErrorBoundary` +
`Suspense` provider in the App layer:

```tsx
// src/app/providers/suspense-provider.tsx
import { Suspense } from "react";
import { ErrorBoundary } from "react-error-boundary";

export const SuspenseProvider = ({ children }) => (
  <ErrorBoundary fallback={<div>Something went wrong</div>}>
    <Suspense fallback={<div>Loading...</div>}>{children}</Suspense>
  </ErrorBoundary>
);
```

### Reading mutation state with useMutationState

`useMutationState` lets any component read the state of a mutation without
passing props, useful for global save indicators. Store mutation keys next
to the query factory:

```typescript
// src/shared/api/post/post.queries.ts
export const POST_MUTATIONS = {
  updateTitle: () => ["post", "update-title"],
  create: () => ["post", "create"],
};
```

Tag the mutation with `mutationKey`, then read its state from any component:

```tsx
// src/features/update-post/api/use-update-post-title.ts
export const useUpdatePostTitle = () =>
  useMutation({
    mutationKey: POST_MUTATIONS.updateTitle(),
    mutationFn: ({ id, newTitle }) => apiClient.patch(`/posts/${id}`, { title: newTitle }),
  });

// src/widgets/save-indicator/ui/save-indicator.tsx
import { useMutationState } from "@tanstack/react-query";
import { POST_MUTATIONS } from "@/shared/api/post";

export const SaveIndicator = () => {
  const isPending = useMutationState({
    filters: { mutationKey: POST_MUTATIONS.updateTitle(), status: "pending" },
    select: (m) => m.state.status,
  }).length > 0;
  return isPending && <span>Saving...</span>;
};
```

### QueryProvider in the app layer

```tsx
// src/app/providers/query-provider.tsx
import { QueryClient, QueryClientProvider, MutationCache, QueryCache } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import { toast } from "sonner";

const queryClient = new QueryClient({
  queryCache: new QueryCache({ onError: (e) => toast.error(e.message) }),
  mutationCache: new MutationCache({ onError: (e) => toast.error(e.message) }),
  defaultOptions: { queries: { staleTime: 5 * 60 * 1000, gcTime: 5 * 60 * 1000 } },
});

export const QueryProvider = ({ children }) => (
  <QueryClientProvider client={queryClient}>
    {children}
    <ReactQueryDevtools />
  </QueryClientProvider>
);
```

`QueryCache.onError` and `MutationCache.onError` give one place to wire up
global toast notifications instead of repeating error handling on every hook.

### Code generation

Tools that generate clients from an OpenAPI/Swagger spec are less flexible
than hand-written factories. If your spec is clean and you adopt a generator,
place the generated code in `@/shared/api/`.

### Custom API client

Standardize base URL, headers, and JSON handling in a single class in
`shared/api/`:

```typescript
// src/shared/api/api-client.ts
export class ApiClient {
  #baseUrl: string;
  constructor(url: string) { this.#baseUrl = url; }

  async #handle<T>(response: Response): Promise<T> {
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    return response.json();
  }

  get = <T>(path: string) => fetch(`${this.#baseUrl}${path}`).then((r) => this.#handle<T>(r));
  // post, put, delete follow the same pattern with method/headers/body.
}

export const apiClient = new ApiClient(API_URL);
```

**Key principle:** Place query and mutation hooks in the slice that owns the
domain. Page-specific queries stay in the page. Shared queries go in
`shared/api/` or `entities/<name>/api/` depending on whether the project has
an Entities layer.

## See also

- [Sample project on GitHub](https://github.com/ruslan4432013/fsd-react-query-example)
- [Query options API (tkdodo blog)](https://tkdodo.eu/blog/the-query-options-api)
