//
//  Readme.md
//  EssentialFeedTests
//
//  Created by mac on 28/08/21.
//

import Foundation


In this episode, we start implementing the RemoteFeedLoader (API) module by following the Load Feed Use Case requirements.

Learning Outcomes
How to test-drive an API layer implementation
Modular Design
Singletons: When and Why
Singletons: Better alternatives
Singletons: Refactoring steps to gradually remove tight coupling created by singletons
Controlling your dependencies: Locating globally shared instances (Implicit) vs. Injecting dependencies (Explicit)
Controlling your dependencies: Dependency injection
The starting point
We have three main guides for designing and implementing the RemoteFeedLoader. The steps listed in the use case, the feature interfaces defined in the previous episode, and test-driven-development.

Even though the RemoteFeedLoader will be a <FeedLoader> implementation, we don't start by conforming to the <FeedLoader> protocol, as it would require us to think too much ahead. Instead, we can take smaller (and safer) steps by test-driving the RemoteFeedLoader implementation. The <FeedLoader> protocol is just a guideline at this time (part of the feature interfaces), so we can conform to it at the end.

Global shared instances vs. Dependency Injection
We go on to demonstrate an evolutionary design for the RemoteFeedLoader's collaborator, the HTTPClient. We show how such a collaborator can start as a concrete singleton and how we can follow a detailed process, backed up by unit tests, to ensure the behavior of the system won't change when we refactor to a more modular (protocol based) solution.

HTTP clients are often implemented as singletons just because it may be more "convenient" to locate the shared instance. However, in our opinion, such an approach may be considered an anti-pattern as it can introduce tight coupling between the modules. In our case, the HTTPClient has no reason to be a singleton, so a more suitable solution to be able to communicate with collaborators is using dependency injection instead. Then we can move the responsibility of locating and injecting the collaborator to a composer module (e.g., Main), so we can focus only on passing messages between the other components.
