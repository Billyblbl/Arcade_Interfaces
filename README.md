# Arcade_Interfaces
Arcade epitech project common interfaces

Game libraries and Graphic libraries must contain a C style function returning a new instance of their respective IGame/IGraphic implementation linked to the symbol "CreateHandler".
An exemple would be for an implementation "SomeLibGraphic : public IGraphic {...}" :

extern "C" {
	IGraphic	*CreateHandler()
	{
		return new SomeLibGraphic;
	}
}
