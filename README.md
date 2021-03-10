# Keycloak Config and Theme
Config and theme for the keycloak instance within dot.base.


## Repository Structure
```sh
- dev      # configuration files theme development
- theme    # dot.base Keycloak Theme
```


## Usage
This repository is part of the dot.base open core.
The corresponding container is automatically deployed through the dot.base installer.
Just follow the steps at dotbase.org to [get started with your own dot.base instance](https://dotbase.org/docs/getting-started.html).


## Contributing
For a detailed introduction into Keycloak config and themes, see the the (Keycloak server development guide)[https://www.keycloak.org/docs/latest/server_development].

### Requirements
- [Docker >= v19](https://docs.docker.com/get-docker/)
- A local copy of this repository

### Running Locally
1. [optional] Initialize a new docker swarm
    ```
    docker swarm init
    ```
1. Start the docker development stack
    ```
    docker stack deploy -c dev/dev-compose.yml keycloak-dev
    ```
1. The server is available at http://127.0.0.1:8080.
1. Go and mix up some code 👩‍💻. Hint: (Click here)[http://127.0.0.1:8080/auth/realms/dotbase/protocol/openid-connect/auth?client_id=central-proxy&redirect_uri=http%3A%2F%2F127.0.0.1%3A8080%2F&response_type=code] to see the login page a normal dot.base user sees. (Click here)[http://127.0.0.1:8080/auth/realms/dotbase/protocol/openid-connect/logout?redirect_uri=http://127.0.0.1:8080/_oauth/logout] to log out.