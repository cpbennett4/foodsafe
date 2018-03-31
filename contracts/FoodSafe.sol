pragma solidity ^0.4.6;


contract FoodSafe {
    struct Location {
        string name;
        uint locationId;
        uint previousLocationId;
        uint timestamp;
        string secret;
    }

    mapping(uint => Location) public trail;
    uint8 public trailCount = 0;

    function addNewLocation(uint locationId, string name, string secret) public {
        Location memory newLocation;
        newLocation.name = name;
        newLocation.locationId = locationId;
        newLocation.secret = secret;
        newLocation.timestamp = now;
        if (trailCount != 0) {
            newLocation.previousLocationId = trail[trailCount].locationId;
        }
        trail[trailCount] = newLocation;
        trailCount++;
    }

    function getTrailCount() public returns (uint8) {
        return trailCount;
    }

    function getLocation(uint8 trailNo) public returns (string, uint, uint, uint, string) {
        return (
            trail[trailNo].name,
            trail[trailNo].locationId,
            trail[trailNo].previousLocationId,
            trail[trailNo].timestamp,
            trail[trailNo].secret
            );
    }
}
