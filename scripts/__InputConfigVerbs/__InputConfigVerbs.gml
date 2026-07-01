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
        ATTACK,
		HOOK,
		DASH,
		JUMP,
		SLIDE,
		
		// Menu Action
		PAUSE,
    }
    
    enum INPUT_CLUSTER
    {
        //Add your own clusters here!
        //Clusters are used for two-dimensional checkers (InputDirection() etc.)
        NAVIGATION,
    }
	
    #region Movement
    InputDefineVerb(INPUT_VERB.UP, "up", [vk_up, "W"], [-gp_axislv, gp_padu]);
    InputDefineVerb(INPUT_VERB.DOWN, "down", [vk_down, "S"], [gp_axislv, gp_padd]);
    InputDefineVerb(INPUT_VERB.LEFT, "left", [vk_right, "D"], [gp_axislh, gp_padr]);
    InputDefineVerb(INPUT_VERB.RIGHT, "right", [vk_left, "A"], [-gp_axislh, gp_padl]);
	#endregion
	
	#region Actions
	InputDefineVerb(INPUT_VERB.ATTACK, "attack", "H", gp_face2);
	InputDefineVerb(INPUT_VERB.HOOK, "hook", "F", gp_face4);
	InputDefineVerb(INPUT_VERB.DASH, "dash", vk_shift, gp_face3);
	InputDefineVerb(INPUT_VERB.JUMP, "jump", vk_space, gp_face1); 
	InputDefineVerb(INPUT_VERB.SLIDE, "slide", [vk_down, "S"], gp_padd); 
    #endregion
	
	#region Menu Action
	InputDefineVerb(INPUT_VERB.PAUSE, "pause", vk_escape, gp_select)
	#endregion
		
	var axisBiasFactor = 0;
	var axisBiasDiagonals = 0;
	
    //Define a cluster of verbs for moving around
    InputDefineCluster(
	INPUT_CLUSTER.NAVIGATION,
	INPUT_VERB.UP, INPUT_VERB.RIGHT, INPUT_VERB.DOWN, INPUT_VERB.LEFT,
	axisBiasFactor,
	axisBiasDiagonals
	);
}
