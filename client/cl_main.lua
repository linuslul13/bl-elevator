
print('^9[BL_CORE] - DEBUG | ELEVATOR LOADED')
local options = {}

for y = 1, #Elevator_Config.Elevator do
	for i = 1, #Elevator_Config.Elevator[y].points do  
        local point = lib.points.new({
            coords = Elevator_Config.Elevator[y].points[i].coords,
            distance = Config.DrawDistance,
        })
                    
        local marker = lib.marker.new({
            coords = Elevator_Config.Elevator[y].points[i].coords,
            type = Config.MarkerType,
        })

        function point:nearby()
            marker:draw()
            if self.currentDistance < 1.5 then
                HelpUI('E', 'um den Aufzug zu benutzen')
                if IsControlJustPressed(0, 51) then  
                    for l = 1, #Elevator_Config.Elevator[y].points do 
                        elevator = {
                            title = Elevator_Config.Elevator[y].points[i].label
                          }
                        end
                    for l = 1, #Elevator_Config.Elevator[y].points do   
                        options[l] = {
                            title = Elevator_Config.Elevator[y].points[l].label,
                            onSelect = function(args)
                                if Elevator_Config.Elevator[y].points[l].label == Elevator_Config.Elevator[y].points[i].label then return  Notify('BLACKLINE CITY', 'Du bist bereits auf dieser Etage!', 'error')end
                                    Citizen.Wait(200)
                                    Notify('BLACKLINE CITY', 'Du bist mit dem Aufzug zu '..Elevator_Config.Elevator[y].points[l].label..' gefahren!')
                                    SetEntityCoords(PlayerPedId(), Elevator_Config.Elevator[y].points[l].coords)
                            end
                        }
                    end
                
                    lib.registerContext({
                        id = 'bl_elevator_menu',
                        title = "BLACKLINE CITY AUFZUG MENU",
                        options = options
                    })
                    Citizen.Wait(100)
                    lib.showContext('bl_elevator_menu')
                end
            end
        end
    end
end