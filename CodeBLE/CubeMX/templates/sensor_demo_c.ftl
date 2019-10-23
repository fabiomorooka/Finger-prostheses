[#ftl]
/**
 * @brief  Initialize User process.
 *
 * @param  None
 * @retval None
 */
static void User_Init(void)
{
  BSP_PB_Init(BUTTON_KEY, BUTTON_MODE_GPIO);
  BSP_LED_Init(LED2);
  
  BSP_COM_Init(COM1);
}

/**
 * @brief  Process user input (i.e. pressing the USER button on Nucleo board)
 *         and send the updated acceleration data to the remote client.
 *
 * @param  AxesRaw_t* p_axes
 * @retval None
 */
static void User_Process(AxesRaw_t* p_axes)
{
  if (set_connectable)
  {
    setConnectable();
    set_connectable = FALSE;    
    user_button_init_state = BSP_PB_GetState(BUTTON_KEY);
  }  

  /* Check if the user has pushed the button */    
  if (BSP_PB_GetState(BUTTON_KEY) == !user_button_init_state) 
  {
    while (BSP_PB_GetState(BUTTON_KEY) == !user_button_init_state); 
    
    BSP_LED_Toggle(LED2);
    
    if (connected)
    {
      /* Update acceleration data */
      p_axes->AXIS_X += 100;
      p_axes->AXIS_Y += 100;
      p_axes->AXIS_Z += 100;
      Acc_Update(p_axes);
    }
  } 
}
