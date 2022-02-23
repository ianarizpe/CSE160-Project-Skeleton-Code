#include "../../includes/packet.h"

interface Neighbor{
   command error_t send(pack msg, uint16_t dest );
}
