# Tic-Tac-Toe in Assembly (NASM)
This is a basic Tic-Tac-Toe Game written entirely in assembly.
## Running the Game
You can run the game by opening a terminal in the `src` directory and executing `make execute`
## Requirements
In order to run this game you must have following installed:
* nasm
* gdb
* make
* gcc
* libc6-dev-i386

You can install these by executing:
```
sudo apt-get update
sudo apt-get -y install nasm\
                        gdb\
                        make\
                        gcc\
                        vim\
                        libc6-dev-i386
```
 This has been developed and tested using Ubuntu 18.04. 
You can also use the dockerfile provided in the project to run the game in a docker container if not running linux.
