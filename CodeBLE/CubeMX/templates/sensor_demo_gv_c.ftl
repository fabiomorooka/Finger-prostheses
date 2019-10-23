[#ftl]
#include "hci_tl.h"
#include "sensor_service.h"
#include "bluenrg_utils.h"
#include "${FamilyName?lower_case}_${BoardName}.h"
#include "bluenrg_gap_aci.h"
#include "bluenrg_gatt_aci.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private defines -----------------------------------------------------------*/
#define BDADDR_SIZE 6
 
/* Private macros ------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
extern volatile uint8_t set_connectable;
extern volatile int     connected;
extern AxesRaw_t        axes_data;
uint8_t bnrg_expansion_board = IDB04A1; /* at startup, suppose the X-NUCLEO-IDB04A1 is used */
uint8_t user_button_init_state;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
static void User_Process(AxesRaw_t* p_axes);
static void User_Init(void);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */
