# Ruby on Rails DevSpaces demo application

This repository shows how to run a Ruby on Rails application in DevSpaces.

## Techstack

1. Ruby on Rails
2. MySQL

## DevSpaces Installation Instructions
1. [Create an account](https://support.devspaces.io/article/21-account-creation-authentication-step-by-step)
2. Install client application
    * [Windows installation instructions](https://support.devspaces.io/article/45-devspaces-client-installation-windows)
    * [MacOS installation instructions](https://support.devspaces.io/article/46-devspaces-client-installation-macos)
    * [Linux installation instructions](https://support.devspaces.io/article/47-devspaces-client-installation-linux)

## Instructions for running application in DevSpaces
1. Clone the repository to your local machine `git clone https://github.com/devfactory/ruby-on-rails-mysql.git`
2. Navigate to devspace directory `cd ruby-on-rails-mysql/devspace`
3. Run `devspaces create` command. This command opens a build status window and shows you the progress of DevSpace creation. Once build is completed, validated starts.
4. Once validation is completed. Run `devspaces ls` command to see the list of DevSpaces, and it's status. Newly created DevSpace `ruby-demo` is in "**Stopped**" status.
5. To start your DevSpace run following command `devspaces start ruby-demo`. You receive a notification when your DevSpace is ready to be used.
6. After the DevSpace is running, go back to repository root `cd ..`. Then run `devspaces bind ruby-demo` command to synch source code from your local machine to the DevSpace.
7. After synching completes, connect to your DevSpace using `devspaces exec ruby-demo` command from your terminal.
8. Now you're inside your DevSpace terminal. To start the application, run startup script `./start.sh`

Once this application is running inside DevSpace, to access the application from your local machine run following command from your local terminal `devspaces info ruby-demo`. URL under URLs section mapped to port `3000` is the public URL to your running application. Append `/dogs` to this URL to see it is working e.g. `http://ruby-demo.<username>.devspaces.io:<port>/dogs`

![Demo](https://drive.google.com/uc?export=view&id=1dBo6X9tCgfz6ufPdPzzo6lQczi-fc4WA)

### Using Code-Server as an online IDE in DevSpaces

[Code-Server](https://github.com/cdr/code-server) project allows you to run Visual Studio Code on remote server and access it via a browser. Configurations in `devspace/code-server` folder show how we can convert the same project to use Code-Server as IDE.

1. Clone the repository to your local machine `git clone https://github.com/devfactory/ruby-on-rails-mysql.git`
2. Navigate to devspace directory `cd ruby-on-rails-mysql/devspace/code-server`
3. Run `devspaces create` command. This command opens a build status window and shows you the progress of DevSpace creation. Once build is completed, validated starts.
4. Once validation is completed. Run `devspaces ls` command to see the list of DevSpaces and corresponding status. Newly created DevSpace `ruby-code-server-demo` will be in "**Stopped**" status.
5. To start your DevSpace run following command `devspaces start ruby-code-server-demo`. You receive a notification when your DevSpace is ready to be used.
6. After the DevSpace is running, go back to repository root `cd ../../`. Then run `devspaces bind ruby-code-server-demo` command to synch source code from your local machine to the DevSpace.
7. After synching completed, run `devspaces info ruby-code-server-demo` command to see the URLs exposed.
8. From the URLs section, find the URL corresponding to port `8443` and open it in your browser which shows VS code IDE for editing source code.
9. From "Terminal" menu, open a new terminal and run script `./start.sh` to start the application. This command starts the application in local port `3000`
10. Go back to your local machine terminal and get the URL corresponding to port `3000` from the `devspaces info ruby-code-server-demo` result. Then open that URL in another browser tab to see the demo application.

![Demo](https://drive.google.com/uc?export=view&id=1rITFqbrm9JE8ZAVkPY63Sg9TFAbCnrvZ)
