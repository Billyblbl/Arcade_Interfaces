# Arcade_Interfaces
Arcade epitech project common interfaces

Game libraries and Graphic libraries must contain an instance of their respective IGame/IGraphic implementation linked to the symbol "LibObject".
And exemple would be for an implementation "SomeLibGraphic : public IGame {...}" :

extern "C" {
	SomeLibGraphic	LibObject;
}
