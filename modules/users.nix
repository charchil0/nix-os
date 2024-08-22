{ config, pkgs, ... }:
{
  users.users.charchil = {
    isNormalUser = true;
    hashedPassword = "$6$YLdBRQDnufxEwj97$RTIyuQ7f41IPGHbIKChS4.6McH0gqn7M4VqDG7U97OJ0Y3vsh336U.iZR8MDApXlIlazwUGpmo2H0db/PPmLc.";
  };


  users.users.root = {
    hashedPassword = "$6$bm41f/gfpv2N47O1$ZHhCLjSmkOcvVNPRSOnBkc/v18cqFkFIGDw6PX.Qea0xmnM6IYTOA.NadwhvEVy5ECWIVUwgS9Og1DTZe9vcI1";
  };
}



