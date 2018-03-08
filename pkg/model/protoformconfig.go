/*
Copyright (C) 2018 Synopsys, Inc.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.
*/

package model

import "github.com/spf13/viper"

type ProtoformConfig struct {
	// general protoform config
	MasterURL      string
	KubeConfigPath string

	// perceptor config
	PerceptorHost             string
	PerceptorPort             int
	AnnotationIntervalSeconds int
	DumpIntervalMinutes       int
	HubHost                   string
	HubUser                   string
	HubUserPassword           string
	HubPort                   int
	ConcurrentScanLimit       int

	UseMockPerceptorMode bool

	AuxConfig *AuxiliaryConfig
}

func ReadProtoformConfig(configPath string) *ProtoformConfig {
	viper.SetConfigFile(configPath)
	pc := &ProtoformConfig{}
	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}
	viper.Unmarshal(pc)
	return pc
}

func (pc *ProtoformConfig) PodPerceiverConfig() PodPerceiverConfigMap {
	return PodPerceiverConfigMap{
		AnnotationIntervalSeconds: pc.AnnotationIntervalSeconds,
		DumpIntervalMinutes:       pc.DumpIntervalMinutes,
		PerceptorHost:             pc.PerceptorHost,
		PerceptorPort:             pc.PerceptorPort,
	}
}

func (pc *ProtoformConfig) ImagePerceiverConfig() ImagePerceiverConfigMap {
	return ImagePerceiverConfigMap{
		AnnotationIntervalSeconds: pc.AnnotationIntervalSeconds,
		DumpIntervalMinutes:       pc.DumpIntervalMinutes,
		PerceptorHost:             pc.PerceptorHost,
		PerceptorPort:             pc.PerceptorPort,
	}
}

func (pc *ProtoformConfig) PerceptorScannerConfig() PerceptorScannerConfigMap {
	return PerceptorScannerConfigMap{
		HubHost:         pc.HubHost,
		HubPort:         pc.HubPort,
		HubUser:         pc.HubUser,
		HubUserPassword: pc.HubUserPassword,
	}
}

func (pc *ProtoformConfig) PerceptorImagefacadeConfig() PerceptorImagefacadeConfigMap {
	return PerceptorImagefacadeConfigMap{
		DockerPassword:   pc.AuxConfig.DockerPassword,
		DockerUser:       pc.AuxConfig.DockerUsername,
		CreateImagesOnly: false,
	}
}

func (pc *ProtoformConfig) PerceptorConfig() PerceptorConfigMap {
	return PerceptorConfigMap{
		ConcurrentScanLimit: pc.ConcurrentScanLimit,
		HubHost:             pc.HubHost,
		HubUser:             pc.HubUser,
		HubUserPassword:     pc.HubUserPassword,
		UseMockMode:         pc.UseMockPerceptorMode,
	}
}