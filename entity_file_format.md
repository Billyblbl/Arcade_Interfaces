# Entity File Format

The A.L.P-a.C.A custom Entity File Format (.entity extension) describes a displayable entity for the purpose of the **[Arcade EPITECH project](https://intra.epitech.eu/module/2018/B-OOP-400/PAR-4-1/acti-322760/project/file/B-OOP-400_arcade.pdf)**, all its possible states and how to display them depending on display's capabilities

## White space & Comments

All lines **starting** with the caracter '#' in an entity file shall be ignored.
All empty lines shall be ignored.

## Sprite

The first usable line must contain either the path to a loadable sprite texture file or the string "undefined". This path must be relative from the execution folder of the core, and designate a file available in the appropriate [RAFH](RAHF.md) location.

## States

All following lines define all states of the graphic entity under the following format:

```entity
<state name>:<upleft coordinates>:<downright coordinates>:<color>:<back color>:<ASCII character>
```

Where:
- `<state name>` is the name of the state,
- `<upleft coordinates>` are the coordinates of the upleft included corner pixel of the rectangle in the texture file containing the image of the state, if the sprite texture is "undefined", this is to be ignored
- `<downright coordinates>` are the coordinates of the downright included corner pixel of the rectangle in the texture file containing the image of the state, if the sprite texture is "undefined", this is to be ignored
- `<color>` is the color of the character for ASCII display of the state
- `<back color>` is the color of the background for ASCII display of the state
- `<ASCII character>` is the character of the state for ASCII display

## Coordinates

Coordinates in a `.entity` file should follow the format `[<x>,<y>]`

Where:
- `<x>` is the position in pixel, on the horizontal axis of the texture file, of the coordinate
- `<y>` is the position in pixel, on the vertical axis of the texture file, of the coordinate

## Colors

Colors in a `.entity` file should follow the 32bit hexadecimal integer format with color order RRGGBBAA (ex for yellow : FFFF00FF)

#### Exemple

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
