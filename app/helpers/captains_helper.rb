module CaptainsHelper

  def combat_skyfarers
    if params[:id].present?
      cpt_id = params[:id]
    else
      cpt_id = current_captain
    end
    @combat_skyfarers = Skyfarer.where(profession: ["Fighter", "Grappler"], captain_id: cpt_id)
  end

  def tactical_skyfarers
    if params[:id].present?
      cpt_id = params[:id]
    else
      cpt_id = current_captain
    end
    @tactical_skyfarers = Skyfarer.where(profession: ["Thief", "Ranger"], captain_id: cpt_id)
  end

  def support_skyfarers
    if params[:id].present?
      cpt_id = params[:id]
    else
      cpt_id = current_captain
    end
    @support_skyfarers = Skyfarer.where(profession: ["Priest", "Enhancer", "Harpist", "Wizard"], captain_id: cpt_id)
  end

  def defense_skyfarers
    if params[:id].present?
      cpt_id = params[:id]
    else
      cpt_id = current_captain
    end
    @defense_skyfarers = Skyfarer.where(profession: ["Knight", "Dragoon"], captain_id: cpt_id)
  end

end
