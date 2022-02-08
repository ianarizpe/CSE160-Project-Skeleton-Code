generic configuration NeighborDiscoveryC{
    provides interface NeighborDiscovery;
}

implementation {
    components new NeighborDiscoveryP();
    NeighborDiscovery = NeighborDiscoveryP.NeighborDiscovery;
    
}