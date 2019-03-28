## About

This reference defines and describes the interfaces, concept, symbols and procedures making up the Arcade Library Plug-able Common API (henceforth referred to as A.L.P-a.C.A). A.L.P-a.C.A is intended, in the context of the academic **[Arcade EPITECH project](https://intra.epitech.eu/module/2018/B-OOP-400/PAR-4-1/acti-322760/project/file/B-OOP-400_arcade.pdf)**, as a common API allowing the manipulation of various games and graphic libraries with the core program of this project. Any game library or graphic handler library following this API is therefore compatible with any core implementing it (save for platform incompatibilities). This API’s concepts are dependent on the use of the [dl library](http://tldp.org/HOWTO/Program-Library-HOWTO/dl-libraries.html) (or any system capable of faithfuly reproducing its behavior) in the implementation of the core.

# Libraries

A.L.P-a.C.A defines two types of usable library, each with a handler class interface :
- [Game Libraries](#game-handler)
- [Graphic Libraries](#graphic-handler)

Game libraries must implement the `IGame` interface as handler type, while Graphic libraries must implement both the `IGraphic` and `IDisplayable` interfaces, with `IGraphic` as their handler type.

## Library symbols

To be loadable by a core, both types of library must define a C-style function with the symbol `CreateHandler` taking no argument and returning a pointer to a dynamically constructed (aka `new` constructed) instance of their implementation of their respective handler type. The signature of the function for a library with a handler type interface `InterfaceType` implemented as `ImplementationType` should therefore be either :
```c++
InterfaceType   *CreateHandler();
```
or
```c++
ImplementationType  *CreateHandler();
```
To ensure symbol preservation against `c++` symbol mangling it is highly encouraged to place the definition of this factory function in an `extern "C"` clause such as
```c++
extern "C" {
	InterfaceType	*CreateHandler()
	{
		return new ImplementationType;
	}
}
```

## Game Handler

A game handler must be a complete implementation in a Game Library of the `IGame` interface, and provide **game logic for handling keyboard presses** through Keycode as `int32_t` type values, as well as **frame ticking game logic** and **status event game logic**, to create a playable game on the core program.

## Graphic Handler

A Graphic handler must be a complete implementation in a Graphic Library of the `IGraphic` interface, and provide a display for the user on which to draw a game loaded in the core program through a Game handler. The nature of the display is **implementation defined** but must provide **Keyboard Input handling**, **Visual on-screen display**, and either **Text writing on display**, **Texture drawing on display** or both, through its implementation and the implementation of the `IDisplayable` interface associated with the Graphical library.

### Displayable Entity

The entities used to draw the frames of the game on the handler's display must be instances of the Graphic library's implementation of the `IDisplayable` interface. This implementation must provide the ability for entities to have a list of several named states in which they can be placed. These states must be defined by the parsing of a file associated with the desired entity, under the A.L.P-a.C.A custom `.entity` file format.

#### Entity File Format

This file format describes a displayable entity for the purpose of the **[Arcade EPITECH project](https://intra.epitech.eu/module/2018/B-OOP-400/PAR-4-1/acti-322760/project/file/B-OOP-400_arcade.pdf)**, all its possible states and how to display them depending on display's capabilities

##### White space & Comments

All lines **starting** with the caracter '#' in an entity file shall be ignored.
All empty lines shall be ignored.

##### Sprite

The first usable line must contain either the path to a loadable sprite texture file or the string "undefined"

##### States

All following lines define all states of the graphic entity under the following format:

```entity
<state name>:<upleft coordinates>:<downright coordinates>:<color>:<back color>:<ASCII character>
```

Where:
- `<state name>` is the name of the state,
- `<upleft coordinates>` are the coordinates of the upleft included corner pixel of the rectangle in the texture file containing the image of the state, if the sprite texture is "undefined", this is to be ignored
- `<downright coordinates>` are the coordinates of the downright included corner pixel of the rectangle in the texture file containing the image of the state, if the sprite texture is "undefined", this is to be ignored
- `<color>` is the color of the character for ASCII display of the state, under hex format (ex: for yellow : ffff00ff)
- `<back color>` is the color of the background for ASCII display of the state, under hex format (ex: for yellow : ffff00ff)
- `<ASCII character>` is the character of the state for ASCII display

##### Coordinates

Coordinates in a `.entity` file should follow the format `[<x>,<y>]`

Where:
- `<x>` is the position in pixel, on the horizontal axis of the texture file, of the coordinate
- `<y>` is the position in pixel, on the vertical axis of the texture file, of the coordinate

##### Exemple

An entity file should roughly look like :

```entity
# Some comment
<path/to/sprite/texture.imageformat>

<1st state name>:[<x>,<y>]:[<x>,<y>]:<color>:<back color>:<ASCII character>
<2nd state name>:[<x>,<y>]:[<x>,<y>]:<color>:<back color>:<ASCII character>
<3rd state name>:[<x>,<y>]:[<x>,<y>]:<color>:<back color>:<ASCII character>
...
<Nth state name>:[<x>,<y>]:[<x>,<y>]:<color>:<back color>:<ASCII character>
```
