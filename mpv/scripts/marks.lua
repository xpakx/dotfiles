local marks = {}

function mark_position(mark)
    marks[mark] = mp.get_property_number("time-pos")
    mp.osd_message("Marked position " .. mark)
    stop_marking()
end

function jump_to_mark(mark)
    local position = marks[mark]
    if position then
        mp.set_property_number("time-pos", position)
        mp.osd_message("Jumped to mark " .. mark)
    else
        mp.osd_message("No mark set for " .. mark)
    end
    stop_marking()
end

mp.add_key_binding("a", "mark_position", function() start_marking(true) end)
mp.add_key_binding("'", "jump_to_mark", function() start_marking(false) end)

local keys = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" }

function start_marking(marking)
	for _, key in pairs(keys) do
		mp.add_forced_key_binding(key, "capture_key_" .. key, function()
			if marking then
				mark_position(key)
			else 
				jump_to_mark(key)
			end
			return false
		end)
	end
end

function stop_marking()
	for _, key in pairs(keys) do
		mp.remove_key_binding("capture_key_" .. key)
	end
end
