# Core-Plugin Architecture:

## Overview:

This is an architecture proposal for all Dart/Flutter in Deriv. The main goal of this architecture is to have a modular, testable, maintainable and extensible codebase.

![Full Architecture View](architecture-diagram.png)

## Pros & Cons:

### Pros:

- **Modularity**: Each module is responsible for a specific functionality. This makes the code more readable and maintainable.

- **Testability**: Each module depends on an abstraction, which makes it easy to pass mocks and test the module in isolation.

- **Maintainability**: Having small components with minimal funtionality allows the code to be maintained easily. Developers can easily find what they are looking for and make changes accordingly w/o considering other modules being affected. (e.g. a bug in the `TradeService` can be fixed without affecting the `MarketsService`).

- **Extensibility**: Each module can be extended to fit custom needs. For example, the `AuthenticationAdapter` can be extended to fit the needs of a specific client application.

- **Reusability**: Components can be reused in other projects as long as the project has the same functionality. For example, the `AuthenticationAdapter` can be used in any project that requires basic authentication functionality.

### Cons:

- **Complexity**: Any architecture will add some complexity to the codebase. This architecture is no different. However, the benefits outweigh the complexity.

<!--
Data later - responsible for fetching data from the server and converting it to data models.

Core/Domain layer - responsible for defining the business logic entities, services and repository contracts.

Adapters/Plugins layer - responsible for implementing the services and repository contracts defined in the core/domain layer.

Application layer - responsible for implementing the business logic and state management.

Client application - responsible for implementing the UI and the application logic.

-->

## Architecture Layers:

### Data Layer:

This layer is responsible for fetching data from the server and converting it to data models. This layer contains two main components:

- **Data Models**: These are the data models that represent the exact `json` response from the server. They are usually generated using `flutter_deriv_api` package.

- **Data Sources**: These are the classes that are responsible for fetching data from either a `Remote` source or a `Local` one.

### Domain/Core Layer:

This layer is responsible for defining the business logic entities, services and repository contracts. This layer contains three main components:

- **Entities**: These are the data models that are used across the application.

- **Services**: These are abstract interfaces that define certain functionality within that specific domain. For example, `BasicLoginService`, `SocialLoginService` and `OTPLoginService` are all different functionalities in the authentication domain. This division by `domain` or `use-case` will help when creatting adapters with custom functionality.

- **Repository contracts**: These are the `data-fetching` methods that a certain service might require. For example, the `BasicLoginService` might require a `BasicLoginContract` that has a `login` method that returns a `UserEntity`.

### Adapters / Plugins Layer:

This layer is responsible for implementing the services and repository contracts defined in the core/domain layer. This layer conains three main components:

- **Repository implementations**: These are the implementations of the repository contracts defined in the core/domain layer. These are usually used by a plugin/plugins.

- **Adapters**: An adapter is nothing but a wrapper around a service (or a set of servuces) from the core/domain, and provides a repository contract that wil help implements this/these services.

- **Plugins**: A plugin extends an adapter, and provides a repository implementation to achieve that functionality.

### Application Layer:

This layer is responsible for implementing the `plugins` (defined in the previous layer), in a more useful application component. For example, the `AuthenticationPlugin` can be implemented in a `AuthenticationCubit` or a `AuthenticationProvider` depending on the needs of the client application.

In addition, this layer could abstract away the cross-service communication functinoality from the next layer, allowing the `Presentation Layer` to only only be concerned with UI and state management.

> Side note: DartMQ is a message queue system that can be used to communicate between services. It's a simple pub/sub implementation that can be used to communicate between services. It's not a requirement, but it's a nice-to-have.

### Presentation Layer:

This layer is mainly response for `UI Rendering`, `State Management` and `SDK initialization`.

## What it solves?

It's not the architecture that solves the problem, the solution is actually a sum of solutions:

- Loose coupling between components. Enhances testability and maintainability. Developers can change any module without affecting any other module.

- Separation of concerns. Each module has a specific functionality and is responsible for that functionality only. This makes the code more readable and maintainable.

- Abstraction. Each module depends on an abstraction, which makes it easy to pass mocks and test the module in isolation.

... among other mini-solutions.

This proposed architecture facilitates the implementation of the above solutions.
