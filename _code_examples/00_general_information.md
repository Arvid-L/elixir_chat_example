# Elixir 

Dynamic, functional, general-purpose programming language to build concurrent, scalable and maintainable applications. Created by Jose Valim in 2012 to make Ruby on Rails Thread Safe.

It runs on the Erlang VM, which is known for running low-latency, distributed and fault-tolerant systems. 

## Erlang is known for the building of: 

- WhatsApp
- Facebook Chat Backend
- Amazon SimpleDB
- AdRoll
- Heroku
- Yahoo 
- Ericsson mobile networks
- T-Mobile SMS
- World of Warcraft

## Elixir is known for the building of:

- Slack
- Bleacher Report (8 times more traffic)
- Discord (11 million concurrent users)
- Pinterest
- PepsiCo

## Why Elixir? 

Today CPUs reach the physical limit of number of transistors that can be placed on a chip, with a lot of cores. It's 


## Components for creating an app

- OTP (Open Telecom Platform): Set of libraries shipped with Erlang
- Mix: Build tool that ships with Elixir for creating, compiling, testing application and managing dependencies
- ExUnit: test-unit based framework that ships with Elixir

```elixir
defmodule KV.MixProject do
  use Mix.Project

  def project do
    [
      app: :kv,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
```


## Important Elixir Frameworks

- Phoenix: Web Applications
- Ecto: Communication with data bases
- Nerves: Embedded Software
- Nx: Machine Learning
- Membrane: Audio/Video Processing 
- Broadway: Data Ingestion and processing 


## Phoenix

Performance: Built on top of the Elixir language and leveraging the concurrency model of the Erlang VM (BEAM), Phoenix is known for its high performance and low-latency response times, making it ideal for handling many simultaneous connections.

Scalability: Phoenix inherits Erlang's fault-tolerant design, allowing applications to handle massive traffic, distribute work across multiple cores, and scale easily both vertically and horizontally.

Real-time Features: Provides robust support for real-time applications through channels, allowing bidirectional communication between the server and clients via WebSockets.

Productivity: Emphasizes developer productivity with powerful abstractions, such as generators, contexts, and the Ecto ORM, enabling rapid application development and maintenance.

Ecosystem & Community: Benefits from a vibrant and supportive community, offering various libraries, plugins, and resources. The Elixir community actively contributes to the framework's growth, ensuring a rich ecosystem.

Reliability: Leveraging Erlang's OTP, Phoenix promotes fault-tolerant, distributed, and reliable systems. It supports hot code reloading for seamless updates without downtime.

Modularity: Encourages a modular codebase with clear separation of concerns, promoting maintainability and testability through features like contexts and explicit application structure.

Security: Provides built-in security features and practices, including protection against common web vulnerabilities like CSRF (Cross-Site Request Forgery) attacks.