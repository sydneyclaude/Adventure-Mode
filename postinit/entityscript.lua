GLOBAL.setfenv(1, GLOBAL)

local _GetSaveRecord = EntityScript.GetSaveRecord
function EntityScript:GetSaveRecord(...)
    if self.thecreatorbuilder == nil or self.skinname == nil then
        return _GetSaveRecord(self,...)
    else
        local record, references = _GetSaveRecord(self,...) -- I think no need here to copy paste the code
        if self.thecreatorbuilder then
            record.thecreatorbuilder = self.thecreatorbuilder
        end
        return record, references
    end
end

function EntityScript:SetTheCreatorBuilder(thecreatorbuilder)
    self.thecreatorbuilder = thecreatorbuilder
end