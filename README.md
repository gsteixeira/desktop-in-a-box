# Desktop In a Box

Run a X environment system inside a docker container.

This allows you to run desktop applications inside a container, connecting through VNC.

How it works?

First we run a XFrameBuffer. Then we start the Fluxbox window manager. So we initialize a VNC server, and now you can connect to it.

How to use it:

- clone the repository

```
   git clone https://github.com/gsteixeira/desktop-in-a-box.git 
```

- Build and run

```
   cd desktop-in-a-box
   ./build <password>
   ./run
```

- now connect through vnc, use the password you passed to build command, to the address:

```
   localhost:5900
```

Desktop-in-a-box uses Fluxbox as window manager. You must **Right click the mouse anywhere on the screen** in order to open the menu. 

If you want to persist your desktop settings, mount a Volume to the /home directory.

Hope it can be useful to you :)



    
