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

The entities used to draw the frames of the game on the handler's display must be instances of the Graphic library's implementation of the `IDisplayable` interface. This implementation must provide the ability for entities to have a list of several named states in which they can be placed. These states must be defined by the parsing of a file associated with the desired entity, under the [A.L.P-a.C.A custom `.entity` file format](entity_file_format.md). This file must be provided in the Graphical library's own ressource folder in the [RAFH](RAFH.md).
