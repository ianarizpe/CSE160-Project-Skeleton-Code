#include "../../includes/am_types.h"

configuration FloodingC(int channel){
   provides interface Flooding;
}

implementation{
   components new FloodingP();
   Flooding = FloodingP.Flooding;
   components new SimpleSendC(channel);
   FloodingP.Sender -> SimpleSendC;


   components new AMSenderC(channel);
   FloodingP.Packet -> AMSenderC;
   FloodingP.AMSend -> AMSenderC;

   components new AMReceiverC(AM_PACK) as GeneralReceive;
   FloodingP.Receiver -> GeneralReceive;

   components new ListC(pack, 20) as KnownPacketsList;
   FloodingP.KnownPacketsList -> KnownPacketsList;
}