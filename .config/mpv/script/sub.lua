function createDir (name,value)
if value~=nil then
     -- print(value)
      -- print("espeak -v persian '" .. value .. "'")
      os.execute("espeak -v fa '" .. value .. " ' ")
  end
    end
mp.observe_property("sub-text", "string", createDir)

