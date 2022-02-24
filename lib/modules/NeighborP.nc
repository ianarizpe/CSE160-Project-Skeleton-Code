#include <Timer.h>
#include "../../includes/command.h"
#include "../../includes/packet.h"
#include "../../includes/CommandMsg.h"
#include "../../includes/sendInfo.h"
#include "../../includes/channels.h"

generic module NeighborP()
{

    //Provides the SimpleSend interface in order to neighbor discover packets
    provides interface Neighbor;
    //Uses SimpleSend interface to forward recieved packet as broadcast
    uses interface SimpleSend as Sender;
    //Uses the Receive interface to determine if received packet is meant for me.
	uses interface Receive as Receiver;

    uses interface Packet;
    uses interface AMPacket;
	//Uses the Queue interface to determine if packet recieved has been seen before
	uses interface List<uint16_t> as Neighborhood;
    uses interface Timer<TMilli> as periodicTimer;

    
    //uses interface AMSend;
   
}


implementation
{
    
    pack sendPackage; 
    //neighbor neighborHolder;
    uint16_t neighborHolder;
    uint16_t SEQ_NUM=200;
    //uint8_t * temp = &SEQ_NUM; //header 
    uint8_t * temp = &SEQ_NUM; //header 

    void makePack(pack * Package, uint16_t src, uint16_t dest, uint16_t TTL, uint16_t seq, uint16_t protocol, uint8_t * payload, uint8_t length);

	bool isNeighbor(uint8_t nodeid);
    error_t addNeighbor(uint8_t nodeid);
    void updateNeighbors();
    void printNeighborhood();

    uint8_t neighbors[19]; //Maximum of 20 neighbors?

    //running
    command void Neighbor.run() 	{ 
        makePack(&sendPackage, TOS_NODE_ID, AM_BROADCAST_ADDR, 1, SEQ_NUM , PROTOCOL_PING, temp , PACKET_MAX_PAYLOAD_SIZE);
        SEQ_NUM++;
        call Sender.send(sendPackage, AM_BROADCAST_ADDR);
        
        call periodicTimer.startPeriodic(100000);
	}

    event void periodicTimer.fired() //timer
    {
        dbg(NEIGHBOR_CHANNEL, "Sending from NeighborDiscovery\n");
        updateNeighbors();




        //optional - call a funsion to organize the list
        makePack(&sendPackage, TOS_NODE_ID, AM_BROADCAST_ADDR, 1, SEQ_NUM , PROTOCOL_PING, temp , PACKET_MAX_PAYLOAD_SIZE);
		call Sender.send(sendPackage, AM_BROADCAST_ADDR);
    }

	command void Neighbor.print() {
		printNeighborhood();
	}

    command error_t Neighbor.send(pack msg, uint16_t dest) {
      call Sender.send(msg, dest);
   }

    event message_t *Receiver.receive(message_t * msg, void *payload, uint8_t len)
    {
        if (len == sizeof(pack)) //check if there's an actual packet
        {
            pack *contents = (pack*) payload;
           dbg(NEIGHBOR_CHANNEL, "NeighborReciver Called \n");

            if (PROTOCOL_PING == contents-> protocol) //got a message, not a reply
            {
                if (contents->TTL == 1)
                {
            } 
            }
        }
    }
}
                 
                
                 

                 // to be continued by you ...