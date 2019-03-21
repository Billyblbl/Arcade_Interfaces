# Arcade_Interfaces
Arcade epitech project common interfaces

Game libraries and Graphic libraries must contain an instance of their respective IGame/IGraphic implementation linked to the symbol "LibObject".
An exemple would be for an implementation "SomeLibGraphic : public IGraphic {...}" :

extern "C" {
	SomeLibGraphic	LibObject;
}
