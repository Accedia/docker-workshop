#!/usr/bin/env node
import * as cdk from '@aws-cdk/core';
import { DockerWorkshopStack } from '../lib/docker-workshop-stack';

// define environment - ACCOUNT + REGION
const envAccediaFrankfurt = { account: '445589059283', region: 'eu-central-1' };

const app = new cdk.App();
new DockerWorkshopStack(app, 'DockerWorkshopStack', { env: envAccediaFrankfurt });
