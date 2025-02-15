#include "../../includes/am_types.h"

generic configuration FloodingC(int channel){
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

   components new AMReceiverC(channel) as GeneralReceive;
   FloodingP.Receiver -> GeneralReceive;

   components new ListC(pack, 20) as KnownPacketsList;
   FloodingP.KnownPacketsList -> KnownPacketsList;
}