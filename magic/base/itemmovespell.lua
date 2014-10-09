--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local basics = require("magic.base.basics")
module("magic.base.itemmovespell")

function DoItemMoveSpell(Caster, TargetPos, ltstate)
    if ( ltstate == Action.abort ) then
        Caster:talk(Character.say, "#me stoppt apprupt mit dem Zaubern.", "#me abruptly stops casting.")
        return;
    end

    basics.loadCorrectDefScript();

    -- Generate the needed
    basics.gemBonis( Caster );

    genderMsg = {};
    genderMsg[Player.german], genderMsg[Player.english] = basics.GenderMessage( Caster );

    if ( Caster:distanceMetricToPosition(TargetPos) > Settings.Range + GemBonis.Range) then
        base.common.InformNLS( Caster,
        "Du bist zuweit weg um diesen Zauber zu sprechen.",
        "You are too far away to cast this spell." );
        return;
    end

    if not base.common.IsLookingAt( Caster, TargetPos ) then
        base.common.InformNLS( Caster,
        "Du drehst dich auf dein Ziel zu um es in dein Blickfeld zu bekommen.",
        "You turn to your target to get it into your field of vision.");
        base.common.TurnTo( Caster, TargetPos );
    end

    if not world:isItemOnField( TargetPos ) then
        base.common.InformNLS( Caster,
        "Du musst diesen Zauber auf ein Item sprechen um Erfolg zu haben.",
        "You have to cast this spell on a item to success.");
        return;
    end

    if ( ltstate == Action.none ) then
        local message = string.gsub( TimeEffects.msg[Player.german], "{PP}", genderMsg[Player.german] );
        --Caster:talkLanguage( Character.say,  Player.german, message );
        message = string.gsub( TimeEffects.msg[Player.english], "{PP}", genderMsg[Player.english] );
        --Caster:talkLanguage( Character.say, Player.english, message );
        Caster:startAction( base.common.Limit( TimeEffects.delay + GemBonis.Time, 0 ), TimeEffects.gfx.id, TimeEffects.gfx.time, TimeEffects.sfx.id, TimeEffects.sfx.time);
        return;
    end

    basics.SayRunes( Caster );

    local CasterVal=basics.CasterValue( Caster );

    if not basics.CheckAndReduceRequirements( Caster, CasterVal ) then
        return;
    end

    if not CasterVal then
        base.common.InformNLS( Caster,
        "Es gelingt dir nicht die n�tige Konzentration aufzubringen um diesen Zauber zur Entfaltung zu bringen.",
        "You fail to concentrate enought to get this spell to its evolvement." );
        return;
    end


    local theItem = world:getItemOnField( TargetPos );
    local comItem = world:getItemStats( theItem );

    local maxWeight = base.common.Scale( Weight.minSkill, Weight.maxSkill, CasterVal );
    if (comItem.Weight <= maxWeight) then
        world:createItemFromItem( theItem, base.common.GetFrontPosition( Caster ), true );
        world:erase( theItem, theItem.number );
    else
        base.common.InformNLS( Caster,
        "Der Gegenschand ist zu schwer. Du schaffst es nicht ihn mit dem Zauber zu bewegen.",
        "The item is too heavy. You fail to move it with this spell." );
        return false;
    end

    basics.performGFX( SpellEffects.gfx, TargetPos );
    basics.performSFX( SpellEffects.sfx, TargetPos );

    if (LuaAnd(Caster:getQuestProgress(24),1) ~= 0 ) then
        return;
    end

    --Caster:learn( 3, Skill.name, 2, Skill.max );
	--Replace with new learn function, see learn.lua 
end

function CastMagic(Caster,ltstate)
    DoItemMoveSpell(Caster,base.common.GetFrontPosition(Caster),ltstate);
end

function CastMagicOnCharacter(Caster,TargetCharacter,ltstate)
    if TargetCharacter then
        DoItemMoveSpell(Caster, TargetCharacter.pos, ltstate);
    else
        CastMagic(Caster,ltstate);
    end
end

function CastMagicOnField(Caster,Targetpos,ltstate)
    DoItemMoveSpell(Caster,Targetpos,ltstate);
end

function CastMagicOnItem(Caster,TargetItem,ltstate)
    DoItemMoveSpell(Caster,TargetItem.pos,ltstate);
end
