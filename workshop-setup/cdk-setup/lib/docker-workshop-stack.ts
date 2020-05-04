import * as cdk from '@aws-cdk/core';
import * as ec2 from '@aws-cdk/aws-ec2';
import { SecurityGroup, InstanceType, InstanceClass, InstanceSize } from '@aws-cdk/aws-ec2';
import * as fs from 'fs';
import { CfnOutput } from '@aws-cdk/core';

export class DockerWorkshopStack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // exctract reading the User Data into component
    const scriptContents = fs.readFileSync('scripts/install-docker.sh', 'utf-8').toString();
    const userData = ec2.UserData.custom(scriptContents);

    const vpc = ec2.Vpc.fromLookup(this, 'VPC', {
      // This imports the default VPC
      isDefault: true
    });

    const securityGroup = new SecurityGroup(this, 'securityGroup', {
      vpc,
      allowAllOutbound: true,
      description: 'Security group that allows incomming connections from Accedia IP addresses',
      securityGroupName: 'Allow Accedia Access'
    });
    // Accedia
    securityGroup.addIngressRule(ec2.Peer.ipv4('92.247.21.34/32'), ec2.Port.allTraffic());
    securityGroup.addIngressRule(ec2.Peer.ipv4('92.247.21.35/32'), ec2.Port.allTraffic());
    securityGroup.addIngressRule(ec2.Peer.ipv4('212.73.143.178/32'), ec2.Port.allTraffic());
    // Tsvetan
    securityGroup.addIngressRule(ec2.Peer.ipv4('93.152.139.216/32'), ec2.Port.allTraffic());
    // Emi
    securityGroup.addIngressRule(ec2.Peer.ipv4('93.152.141.235/32'), ec2.Port.allTraffic());


    const participants = this.getParticipants();
    console.log('Spinning up ' + participants.length + ' instances');
    console.log(participants);

    // Iterate participands txt file and create n ec2 isntances for each
    for (const participant of participants) {
      const instanceName = participant.replace(' ', '-');
      const ec2Instance = new ec2.Instance(this, 'ec2-' + instanceName, {
        instanceType: InstanceType.of(InstanceClass.T2, InstanceSize.MICRO),
        machineImage: ec2.MachineImage.genericLinux({
          'eu-central-1': 'ami-07cda0db070313c52'
        }),
        vpc,
        securityGroup,
        keyName: 'docker-ec2',
        instanceName,
        userData,
      });
      new CfnOutput(this, instanceName, { value: ec2Instance.instancePublicIp });
    }
  }

  private getParticipants() {
    return fs.readFileSync('scripts/participants.txt', 'utf-8').split('\n').filter(n => n.trim());
  }
}
