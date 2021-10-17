local inspect = require('libs.inspect')
local general = require('libs.general')

-- BasicButton
local BasicButton = {
  height = 64
}
BasicButton.__index = BasicButton

-- Button
local Button = general.class(function(Button)
    function Button.new(name, text, fn)
        local self = setmetatable({}, Button)
        self.name = name
        self.text = text
        self.fn = fn
        self.height = BasicButton.height
        self.position = {}
        self.position.x = 0
        self.position.y = 0
        return self
    end
    function Button.spawn(self, x, y)
        self.position.x = x
        self.position.y = y
    end
    function Button.render(self)
        print(("Rendering Button " + self.name))
        self.dump()
    end
    function Button.dump(self)
      print('Button dump()')
      print(inspect(self))
    end
    return Button
end, {})

return Button