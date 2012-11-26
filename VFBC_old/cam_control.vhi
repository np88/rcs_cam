
-- VHDL Instantiation Created from source file cam_control.vhd -- 14:41:28 11/26/2012
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT cam_control
	PORT(
		clk_i : IN std_logic;
		rst_i : IN std_logic;
		start_transfer : IN std_logic;       
		cam_i2c_scl_io : INOUT std_logic;
		cam_i2c_sda_io : INOUT std_logic
		);
	END COMPONENT;

	Inst_cam_control: cam_control PORT MAP(
		clk_i => ,
		rst_i => ,
		start_transfer => ,
		cam_i2c_scl_io => ,
		cam_i2c_sda_io => 
	);


