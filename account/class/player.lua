local player = {}
player.__index = player

function player:init(ply)
   setmetatable(ply, self)
   self.__index = self
   return ply
end

function player:getsteamId()
   return self.money
end

-- NAME
function player:getName()
   return self.name
end

function player:setName(str)
   self.name = str
   return true
end

-- HEALTH
function player:getHealth()
   return self.health
end

function player:setHealth(amt)
   self.health = amt
   return true
end

-- ARMOR
function player:getArmor()
   return self.armor
end

function player:setArmor(amt)
   self.armor = amt
   return true
end

-- Food
function player:getFood()
   return self.food
end

function player:setFood(amt)
   self.food = amt
   return true
end

-- THIRST
function player:getThirst()
   return self.thirst
end

function player:setThirst(amt)
   self.thirst = amt
   return true
end

-- CASH
function player:getCash()
   return self.cash
end

function player:setCash(amt)
   self.cash = amt
   return true
end

-- CASH ACCOUNT
function player:getCashAccount()
   return self.cash_account
end

function player:setCashAccount(amt)
   self.cash_account = amt
   return true
end

-- INVENTORY
function player:getInventory()
   return self.inventory
end

function player:setInventory(inv)
   self.inventory = inv
   return true
end

-- CLOTHING
function player:getClothing()
   return self.clothing
end

function player:setClothing(clot)
   self.clothing = clot
   return true
end

-- WEIGHT
function player:getMaxWeight()
   return self.MaxWeight
end

function player:setMaxWeight(MaxWeight)
   self.MaxWeight = MaxWeight
   return true
end

-- CURRENT WEIGHT
function player:getCurWeight()
   return self.CurWeight
end

function player:setCurWeight(CurWeight)
   self.CurWeight = CurWeight
   return true
end

-- ALERT COUNT
function player:getAlertCount()
   return self.alert_count
end

function player:setAlertCount(num)
   self.alert_count = num
   return true
end

-- ACTIVE
function player:getActive()
   return self.active
end

function player:setActive(bool)
   self.active = bool
   return true
end

-- BACKUP
function player:getBackUpStatus()
   return self.backup_status
end

function player:setBackUpStatus(bool)
   self.backup_status = bool
   return true
end

local function newPlayer(playerInfo)
   return player:init(playerInfo)
end

return {["new"] = newPlayer}