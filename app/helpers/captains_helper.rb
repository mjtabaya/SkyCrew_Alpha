module CaptainsHelper
  
  def combat_skyfarers
    @combat_skyfarers = Skyfarer.where(profession: ["Fighter", "Grappler"], captain_id: current_captain)
  end

  def tactical_skyfarers
    @tactical_skyfarers = Skyfarer.where(profession: ["Thief", "Ranger"], captain_id: current_captain)
  end

  def support_skyfarers
    @support_skyfarers = Skyfarer.where(profession: ["Priest", "Enhancer", "Harpist", "Wizard"], captain_id: current_captain)
  end

  def defense_skyfarers
    @defense_skyfarers = Skyfarer.where(profession: ["Knight", "Dragoon"], captain_id: current_captain)
  end

end
