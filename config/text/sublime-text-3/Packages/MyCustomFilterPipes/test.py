import subprocess
data="At this point of development of the technology, LoRaWAN\
faces deployment trends that can result in future inefficiencies.\
Specifically, LoRaWAN networks are being deployed follow-\
ing the cellular network model, that is, network operators\
provide connectivity as a service. This model is making\
gateways to become base stations covering large areas. In turn,\
application developers use the connectivity service provided by\
network operators to extract data from their end-devices using\
the common infrastructure. As LoRaWAN coverage areas are\
being progressively populated by different vendor applications\
that share the same infrastructure, new challenges are posed to\
coordinate the different applications. Therefore, this model, i.e.\
the cellular network operator, requires techniques to ensure fair\
spectrum sharing between application nodes, as the congestion\
grows with scale despite of the existing regulations."

val=subprocess.Popen("echo '%s' | sed -z -r '\n\
          s/\\n\\n+/</g\n\
          s/([^\\n]+)/\\1>/g\n\
          s/\\.[ \\t]*\\n/vgyhn/g\n\
          s/}[ \\t]*\\n/pvkglyhn/g\n\
          \n\
          s/\\n[\\t ]*/ /g\n\
          s/\\t+//g\n\
          \n\
          s/(\\.)[ \\t]+([^0-9])/\\1\\n\\2/g\n\
          s/([,:;])[ \\t]+([^0-9])/\\1\\n\\t\\2/g\n\
          \n\
          s/vgyhn/\\.\\n/g\n\
          s/pvkglyhn/\\}\\n/g\n\
          s/</\\n\\n/g\n\
          s/>[ \\t]*/\\n/g\n\
          \n\
          s/\\- //g'" % data,   shell=True)
print (val)
