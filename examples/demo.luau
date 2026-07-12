--!strict
const Players = game:GetService("Players")

type Pet = { name: string, level: number, instance: Model? }

const DEFAULT_LEVEL = 1
const MAX_LEVEL = 100 -- TODO: Increase level in future updates

const function createPet(name: string): Pet
	return { name = name, level = DEFAULT_LEVEL }
end

const function levelUp(pet: Pet, amount: number?): Pet
	pet.level = math.clamp(pet.level + (amount or 1), DEFAULT_LEVEL, MAX_LEVEL)
	print(`{pet.name} reached level {pet.level}!`)

	return pet
end

const function setInstance(pet: Pet, instance: Model): () -> ()
	pet.instance = instance

	return function()
		pet.instance = nil
	end
end

local pets: { Pet } = {}
for i = 1, 3 do
	table.insert(pets, createPet("Pet_" .. i))
end

Players.PlayerAdded:Connect(function(player: Player): ()
	for _, pet in pets do
		levelUp(pet, 5)
	end
end)

return pets
