function __InputConfigVerbs()
{
    enum INPUT_VERB
    {
        // Movement
        UP,
        DOWN,
        LEFT,
        RIGHT,
		
		// Actions
        ATTACK_1,
		ATTACK_2,
		
		HOOK,
		DASH,
		JUMP,
		SLIDE,
		
		RUN, // kind of a action but not really
		
		// Menu Action
		PAUSE,
		
		// Joystick Aim
		AIM_UP,
		AIM_DOWN,
		AIM_LEFT,
		AIM_RIGHT,
    }
    
    enum INPUT_CLUSTER
    {
        NAVIGATION,
		JOYSTICK_AIM
    }
	
    #region Movement
    InputDefineVerb(INPUT_VERB.UP, "up", [vk_up, "W"], [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN, "down", [vk_down, "S"], [gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT, "left", [vk_right, "D"], [gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.RIGHT, "right", [vk_left, "A"], [-gp_axislh, gp_padl]);
	#endregion
	
	#region Actions
	InputDefineVerb(INPUT_VERB.ATTACK_1, "attack_1", mb_left, gp_shoulderlb);
	InputDefineVerb(INPUT_VERB.ATTACK_2, "attack_2", mb_right, gp_shoulderrb);
	
	InputDefineVerb(INPUT_VERB.HOOK, "hook", vk_shift, gp_face1);
	
	InputDefineVerb(INPUT_VERB.DASH, "dash", "F", gp_shoulderl);
	
	InputDefineVerb(INPUT_VERB.JUMP, "jump", vk_space, gp_shoulderr); 
	
	InputDefineVerb(INPUT_VERB.SLIDE, "slide", [vk_down, "S"], gp_padd); // remove?
	
	InputDefineVerb(INPUT_VERB.RUN, "run", "X", gp_face4); // remove?
    #endregion
	
	#region Menu Action
	InputDefineVerb(INPUT_VERB.PAUSE, "pause", vk_escape, gp_select)
	#endregion
		
	#region Joystick Aimming
	InputDefineVerb(INPUT_VERB.AIM_UP, "aim_up", undefined, [-gp_axisrv]);
    InputDefineVerb(INPUT_VERB.AIM_DOWN, "aim_down", undefined, [gp_axisrv]);
    InputDefineVerb(INPUT_VERB.AIM_LEFT, "aim_left", undefined, [-gp_axisrh]);
    InputDefineVerb(INPUT_VERB.AIM_RIGHT, "aim_right", undefined, [gp_axisrh]);
	#endregion	
	
	var axisBiasFactor = 0;
	var axisBiasDiagonals = 0;
	
    // Movement Cluster
    InputDefineCluster(
	INPUT_CLUSTER.NAVIGATION,
	INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT,
	axisBiasFactor,
	axisBiasDiagonals
	);
	
	// Joystick Aim Cluster
	InputDefineCluster(
	INPUT_CLUSTER.JOYSTICK_AIM,
	INPUT_VERB.AIM_UP, INPUT_VERB.AIM_RIGHT, INPUT_VERB.AIM_DOWN, INPUT_VERB.AIM_LEFT,
	0, 0
	);
	
}
