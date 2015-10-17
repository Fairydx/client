Core.Network = {
	Protocol = {}
}

local Path = ...
local Network = Core.Network

function Network.Load()
	local Host = enet.host_create("localhost:0", 256, 0, CONST.NET.CHANNELS.MAX)
	if Host then
		Console.Print("Initialized UDP socket "..Host:get_socket_address(), 0, 255, 0, 255)
		Network.Host = Host
	else
		Console.Print("Failed to open socket", 255, 0, 0, 255)
	end
	
	Network.Load = nil
end

function Network.Update()
	if Network.Host then
		local Event = Network.Host:service()
		while Event do
			Event = Network.Host:service()
			
			if Event.type == "receive" then
				local Message = Event.data
				local PacketType
				
				PacketType, Message = Message:ReadShort()
				local Function = Network.Protocol[PacketType]
				if Function then
					Function(event.peer, Message)
				end
			end
		end
		
		Network.Host:flush()
	end
end

Hook.Add("update", Network.Update)
