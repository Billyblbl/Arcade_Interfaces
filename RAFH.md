# Ressource Acquisition File Hierarchy

To ensure compatibility of all libraries, ressources acquisition of [Entity files](entity_file_format.md), Spritesheet textures and others must follow the *same pattern*, which means all ressources lookups must follow a *common path structure hierarchy*. As such, A.L.P-a.C.A defines the following **Ressource Acquisition File Hierarchy**:

- `<root>`/
	- ressources/
		- libs/
			- `<lib>`/
		- games/
			- `<lib>`/

Where:

- `<root>` is the folder from which the core is being executed
- `<lib>` is a folder named after an A.L.P-a.C.A compliant library, and contain that library's own ressource hierarchy

Each library's own ressource hierarchy's model is left to its own discretion.

#### Exemple

	arcade/
		ressources/
			libs/
				somelib/
					fonts/
						someFont.ttf
			games/
				someGame/
					entities/
						anEntity.entity
						anotherEntity.entity
					textures/
						anEntitysTexture.png
						anotherEntitysTexture.png
