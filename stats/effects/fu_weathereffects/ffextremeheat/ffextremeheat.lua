function init()
  animator.setParticleEmitterOffsetRegion("flamesfu", mcontroller.boundBox())
  animator.setParticleEmitterActive("flamesfu", true)
  effect.setParentDirectives("fade=FF8800=0.2")
  script.setUpdateDelta(5)
  self.tickDamagePercentage = 0.056
  self.tickTime = 1.0
  self.tickTimer = self.tickTime
  world.sendEntityMessage(entity.id(), "queueRadioMessage", "ffbiomeheat", 5.0)
end



function update(dt)
  mcontroller.controlModifiers({
      groundMovementModifier = 0.65,
      runModifier = 0.60,
      jumpModifier = 0.77
    })
    
  self.tickTimer = self.tickTimer - dt
  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = math.floor(status.resourceMax("health") * self.tickDamagePercentage) + 2,
        damageSourceKind = "hellfireweapon",
        sourceEntityId = entity.id()
      })
  end
end

function uninit()

end