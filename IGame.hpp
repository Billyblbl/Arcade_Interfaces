/*
** EPITECH PROJECT, 2019
** Arcade
** File description:
** game interface
*/

#ifndef IGAME_HPP_
    #define IGAME_HPP_

    #include <functional>
    #include "IGraphic.hpp"

class IGame {
	public:

    typedef std::function<void ()>  Action;

    virtual void update() = 0;
    virtual Action  &getKeybind(char key) const = 0;
    virtual void    setGraphic(IGraphic &handler) = 0;

};

#endif /* !IGAME_HPP_ */
