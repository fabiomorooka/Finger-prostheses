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
 * @brief  Configure the device as Client or Server and manage the communication
 *         between a client and a server.
 *
 * @param  None
 * @retval None
 */
static void User_Process(void)
{
  if (set_connectable) 
  {
    /* Establish connection with remote device */
    Make_Connection();
    set_connectable = FALSE;
    user_button_init_state = BSP_PB_GetState(BUTTON_KEY);
  }
  
  if (BLE_Role == CLIENT) 
  {
    /* Start TX handle Characteristic dynamic discovery if not yet done */
    if (connected && !end_read_tx_char_handle){
      startReadTXCharHandle();
    }
    /* Start RX handle Characteristic dynamic discovery if not yet done */
    else if (connected && !end_read_rx_char_handle){      
      startReadRXCharHandle();
    }
    
    if (connected && end_read_tx_char_handle && end_read_rx_char_handle && !notification_enabled) 
    {
      BSP_LED_Off(LED2); //end of the connection and chars discovery phase
      enableNotification();
    }
  }  

  /* Check if the user has pushed the button */  
  if (BSP_PB_GetState(BUTTON_KEY) == !user_button_init_state)
  {
    while (BSP_PB_GetState(BUTTON_KEY) == !user_button_init_state);
    
    if(connected && notification_enabled){
      /* Send a toggle command to the remote device */
      uint8_t data[20] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J'};
      sendData(data, sizeof(data));
      
      //BSP_LED_Toggle(LED2);  // toggle the LED2 locally.
                               // If uncommented be sure BSP_LED_Init(LED2) is
                               // called in main().
                               // E.g. it can be enabled for debugging.
    }
  } 
}
