﻿// Copyright 2013 M-Lab
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package  {
	
	public class DispMsgs {
		
		/*
		
			Class that holds the display messages referred
			to in other classes.
			
		*/

		public static const gbps10:String = "10 Gbps 10 Gigabit Ethernet/OC-192 subnet";
		public static const mbps10:String = "10 Mbps Ethernet subnet";
		public static const mins10:String = "10 mins";
		public static const hours12:String = "12 hours";
		public static const day1:String = "1 day";
		public static const gbps1:String = "1.0 Gbps Gigabit Ethernet subnet";
		public static const mins1:String = "1 min";
		public static const gbps2_4:String = "2.4 Gbps OC-48 subnet";
		public static const hours2:String = "2 hours";
		public static const mins30:String = "30 mins";
		public static const mbps45:String = "45 Mbps T3/DS3 subnet";
		public static const mins5:String = "5 mins";
		public static const mbps622:String = "a 622 Mbps OC-12 subnet";
		public static const And:String = "and";
		public static const architecture:String = "Architecture";		
		public static const bytes:String = "Bytes";
		public static const c2s:String = "C2S";
		public static const c2sPacketQueuingDetected:String = "[C2S]: Packet queueing detected";
		public static const c2sThroughput:String = "C2S throughput";
		public static const c2sThroughputFailed:String = "C2S throughput test FAILED!";
		public static const cabledsl:String = "Cable/DSL modem";
		public static const cablesNok:String = "Warning: excessive network errors, check network cable(s)";
		public static const cablesOk:String = "Good network cable(s) found";
		public static const checkingFirewalls:String = "Checking for firewalls . . . . . . . . . . . . . . . . . . .";
		public static const checkingMiddleboxes:String = "Checking for Middleboxes  . . . . . . . . . . . . . . . . . .";
		public static const clickStart:String = "Click START to start the test";
		public static const clickStart2:String = "Click START to re-test";
		public static const client:String = "Client";
		public static const client2:String = "Client";
		public static const clientAcksReport:String = "Client Acks report link is";
		public static const clientDataReports:String = "Client Data reports link is";
		public static const clientInfo:String = "Client System Details";
		public static const clientIpModified:String = "Information: Network Address Translation (NAT) box is modifying the Client's IP address";
		public static const clientIpNotFound:String = "Client IP address not found.  For IE users, modify the Java parameters\n click Tools - Internet Options - Security - Custom Level, scroll down to\n Microsoft VM - Java permissions and click Custom, click Java Custom Settings\n Edit Permissions - Access to all Network Addresses, click Eanble and save changes";
		public static const clientIpPreserved:String = "Client IP addresses are preserved End-to-End";
		public static const clientSays:String = "but Client says";
		public static const Close:String = "Close";
		public static const comments:String = "Comments";
		public static const congestNo:String = "No network congestion discovered.";
		public static const congestYes:String = "Information: throughput is limited by other network traffic.";
		public static const connIdle:String = "The connection was idle";
		public static const connStalled:String = "The connection stalled";
		public static const connected:String = "Connected to:";
		public static const connectedTo:String = "is connected to a";
		public static const copy:String = "Copy";
		public static const defaultTests:String = "Default tests";
		public static const delayBetweenTests:String = "Delay between tests";
		public static const detailedStats:String = "Detailed Statistics";
		public static const dialup:String = "Dial-up Modem";
		public static const dialup2:String = "Dial-up";
		public static const done:String = "Done.";
		public static const done2:String = "Tcpbw100 done";
		public static const dupAcksIn:String = "duplicate acks received";
		public static const duplexFullHalf:String = "Alarm: Duplex Mismatch condition detected Switch=Full and Host=half";
		public static const duplexHalfFull:String = "Alarm: Duplex Mismatch condition detected Switch=half and Host=full";
		public static const duplexNok:String = "Warning: Old Duplex mismatch condition detected:";
		public static const duplexOk:String = "Normal duplex operation found.";
		public static const endOfEmail:String = "End Of Email Message";
		public static const excLoss:String = "Excessive packet loss is impacting your performance, check the auto-negotiate function on your local PC and network switch";
		public static const excessiveErrors:String = "Alarm: Excessive errors, check network cable(s).";
		public static const firewallNo:String = "is not behind a firewall. [Connection to the ephemeral port was successful]";
		public static const firewallYes:String = "is probably behind a firewall. [Connection to the ephemeral port failed]";
		public static const flowControlLimits:String = "The network based flow control limits the throughput to";
		public static const found100mbps:String = "100 Mbps FastEthernet link found.";
		public static const found10gbps:String = "10 Gbps 10 GigEthernet/OC-192 link found.";
		public static const found10mbps:String = "10 Mbps Ethernet link found.";
		public static const found1gbps:String = "1 Gbps GigabitEthernet link found.";
		public static const found2_4gbps:String = "2.4 Gbps OC-48 link found.";
		public static const found45mbps:String = "45 Mbps T3/DS3 link found.";
		public static const found622mbps:String = "622 Mbps OC-12 link found.";
		public static const foundDialup:String = "Dial-up modem link found.";
		public static const foundDsl:String = "Cable modem/DSL/T1 link found.";
		public static const fullDuplex:String = "Full duplex Fast Ethernet subnet";
		public static const general:String = "General";
		public static const generatingReport:String = "Generating Trouble Report:  This report will be emailed to the person you specify";
		public static const getWeb100Var:String = "Get WEB100 Variables";
		public static const halfDuplex:String = "Half duplex Fast Ethernet subnet";
		public static const id:String = "TCP/Web100 Network Diagnostic Tool";
		public static const immediate:String = "immediate";
		public static const inboundTest:String = "Tcpbw100 inbound test...";
		public static const inboundWrongMessage:String = "S2C throughput test: Received wrong type of the message";
		public static const incompatibleVersion:String = "Incompatible version number";
		public static const incrRxBuf:String = "Increasing the the client's receive buffer";
		public static const incrTxBuf:String = "Increasing the NDT server's send buffer";
		public static const information:String = "Information";
		public static const initialization:String = "Initialization...";
		public static const insufficient:String = "Insufficent data collected to determine link type.";
		public static const invokingMailtoFunction:String = "Tcpbw100 Invoking Mailto function";
		public static const ipProtocol:String = "IP protocol";
		public static const ipcFail:String = "Interprocess communications failed, unknown link type.";
		public static const usingIpv4:String = " --  Using IPv4 address";
		public static const usingIpv6:String = " --  Using IPv6 address";
		public static const flashData:String = "Flash data";
		public static const kbyteBufferLimits:String = "KByte buffer which limits the throughput to";
		public static const limitNet:String = "network limited";
		public static const limitRx:String = "receiver limited";
		public static const limitTx:String = "sender limited";
		public static const linkFullDpx:String = "Link set to Full Duplex mode";
		public static const linkHalfDpx:String = "Link set to Half Duplex mode";
		public static const loggingWrongMessage:String = "Logging to server: Received wrong type of the message";
		public static const lookupError:String = "Unable to obtain remote IP address";
		public static const mboxWrongMessage:String = "Middlebox test: Received wrong type of the message";
		public static const meta:String = "META";
		public static const metaFailed:String = "META test FAILED!";
		public static const metaTest:String = "META test...";
		public static const metaWrongMessage:String = "META test: Received wrong type of the message";
		public static const middlebox:String = "Middlebox";
		public static const middleboxFail:String = "Server Failed while middlebox testing";
		public static const middleboxFail2:String = "Middlebox test FAILED!";
		public static const middleboxModifyingMss:String = "Information: Network Middlebox is modifying MSS variable";
		public static const middleboxTest:String = "Tcpbw100 Middlebox test...";
		public static const moreDetails:String = "More Details...";
		public static const Name:String = "Name";
		public static const ndtServerHas:String = "The NDT server has a";
		public static const noPktLoss1:String = "No packet loss";
		public static const noPktLoss2:String = "No packet loss was observed";
		public static const numberOfTests:String = "Number of tests";
		public static const of:String = "of";
		public static const off:String = "OFF";
		public static const ok:String = "OK";
		public static const oldDuplexMismatch:String = "Warning: Old Duplex mismatch condition detected: ";
		public static const On:String = "ON";
		public static const ooOrder:String = "but packets arrived out-of-order";
		public static const options:String = "Options";
		public static const osData:String = "OS data:";
		public static const otherClient:String = "Another client is currently being served, your test will begin within ";
		public static const otherTraffic:String = "Information: Other network traffic is congesting the link";
		public static const outboundTest:String = "Tcpbw100 outbound test...";
		public static const outboundWrongMessage:String = "C2S throughput test: Received wrong type of the message";
		public static const packetQueuing:String = "Packet queuing";
		public static const packetQueuingInfo:String = "TCP (Transmission Control Protocol) reliably transfers data between two\n Internet hosts.  It automatically detects and recovers from errors and\n losses.  TCP uses buffers to provide this reliability.  In addition,\n switches and routers use buffers to handle cases where multiple input\n links send packets to a single output link or link speeds change\n (FastEthernet to DSL modem).\n\n The NDT server generates and sends 10 seconds of data to the client.  In\n some cases the server can generate data faster than it can send packets\n into the network (e.g., a 2 GHz CPU sending to a DSL connected client).\n When this happens, some packets may remain in the server output queue\n when the 10 second timer expires.  TCP will automatically continue to\n send these queued packets and the client will continue to accept and\n process these incoming packets.  This will result in the client test\n running longer than expected.\n\n This condition has occurred during this test.  No action is required to\n resolve this issue.";
		public static const packetSizePreserved:String = "Packet size is preserved End-to-End";
		public static const packetsize:String = "the Packet size";
		public static const pc:String = "PC";
		public static const pctOfTime:String = "% of the time";
		public static const performedTests:String = "Performed tests";
		public static const pktsRetrans:String = "packets retransmitted";
		public static const possibleDuplexFullHalf:String = "Alarm: Possible Duplex Mismatch condition detected Switch=Full and Host=half";
		public static const possibleDuplexHalfFull:String = "Alarm: Possible Duplex Mismatch condition detected Switch=half and Host=full";
		public static const possibleDuplexHalfFullWarning:String = "Warning: Possible Duplex Mismatch condition detected Switch=half and Host=full";
		public static const preferIPv6:String = "prefer IPv6";
		public static const printDetailedStats:String = "Print Detailed Statistics";
		public static const protocolError:String = "Protocol error!  Expected 'prepare', got: 0x";
		public static const qSeen:String = "throughput test: Packet queuing detected";
		public static const ready:String = "Tcpbw100 ready";
		public static const receiveBufferShouldBe:String = "Information: The receive buffer should be";
		public static const receiving:String = "Receiving results...";
		public static const reportProblem:String = "Report problem";
		public static const resultsParseError:String = "Error parsing test results!";
		public static const resultsTimeout:String = "Warning! Client time-out while reading data, possible duplex mismatch exists";
		public static const resultsWrongMessage:String = "Tests results: Received wrong type of the message";
		public static const rtt:String = "RTT";
		public static const rttFail:String = "Link detection algorithm failed due to excessive Round Trip Times.";
		public static const runningInboundTest:String = "running 10s inbound test (server-to-client [S2C]) . . . . . .";
		public static const runningOutboundTest:String = "running 10s outbound test (client-to-server [C2S]) . . . . .";
		public static const s2c:String = "S2C";
		public static const s2cPacketQueuingDetected:String = "[S2C]: Packet queueing detected";
		public static const s2cThroughput:String = "S2C throughput";
		public static const s2cThroughputFailed:String = "S2C throughput test FAILED!";
		public static const sackReceived:String = "SACK blocks received";
		public static const scalingFactors:String = "Scaling Factors";
		public static const seconds:String = "seconds";
		public static const sendingMetaInformation:String = "Sending META information . . . . . . . . . . . . . . . . . . .";
		public static const server:String = "Server";
		public static const serverAcksReport:String = "Server Acks report link is";
		public static const serverFault:String = "Server Fault: unknown fault occurred.  Please try again later";
		public static const serverBusy:String = "Server Busy: Too many clients waiting in server queue.  Please try again later";
		public static const serverBusy15s:String = "Server Busy: Please wait 15 seconds for previous test to finish";
		public static const serverBusy30s:String = "Server busy: Please wait 30 seconds for previous test to finish";
		public static const serverBusy60s:String = "Server Busy: Please wait 60 seconds for previous test to finish";
		public static const serverDataReports:String = "Server Data reports link is";
		public static const serverFail:String = "Server failed while receiving data";
		public static const serverIpModified:String = "Information: Network Address Translation (NAT) box is modifying the Client's IP address";
		public static const serverIpPreserved:String = "Server IP addresses are preserved End-to-End";
		public static const serverNotRunning:String = "Server process not running: start web100srv process on remote server";
		public static const serverSays:String = "Server says";
		public static const sfwFail:String = "Simple firewall test FAILED!";
		public static const sfwSocketFail:String = "Simple firewall test: Cannot create listen socket";
		public static const sfwTest:String = "Simple firewall test...";
		public static const sfwWrongMessage:String = "Simple firewall test: Received wrong type of the message";
		public static const showOptions:String = "Show options";
		public static const simpleFirewall:String = "Simple firewall";
		public static const sleep10m:String = "Sleeping for 10 mins...";
		public static const sleep1m:String = "Sleeping for 1 min...";
		public static const sleep30m:String = "Sleeping for 30 mins...";
		public static const sleep5m:String = "Sleeping for 5 mins...";
		public static const sleep12h:String = "Sleeping for 12 hours...";
		public static const sleep1d:String = "Sleeping for 1 day...";
		public static const sleep2h:String = "Sleeping for 2 hours...";
		public static const Start:String = "START";
		public static const startingTest:String = "Starting test";
		public static const statistics:String = "Statistics";
		public static const Stop:String = "STOP";
		public static const Stopped:String = "The tests were stopped!";
		public static const stopping:String = "Stopping...";
		public static const systemFault:String = "System Fault";
		public static const test:String = "Test";
		public static const testsuiteWrongMessage:String = "Negotiating test suite: Received wrong type of the message";
		public static const theSlowestLink:String = "The slowest link in the end-to-end path is a ";
		public static const theoreticalLimit:String = "The theoretical network limit is";
		public static const thisConnIs:String = "This connection is";
		public static const timesPktLoss:String = "times due to packet loss";
		public static const toMaximizeThroughput:String = "kbytes to maximize throughput";
		public static const troubleReportFrom:String = "Trouble Report from NDT on";
		public static const unableToDetectBottleneck:String = "Server unable to determine bottleneck link type.";
		public static const unableToObtainIP:String = "Unable to obtain local IP address";
		public static const unknownID:String = "Unknown test ID";
		public static const unknownServer:String = "Unknown server";
		public static const unsupportedClient:String = "Information: The server does not support this client";
		public static const vendor:String = "Vendor";
		public static const version:String = "Version";
		public static const versionWrongMessage:String = "Negotiating NDT version: Received wrong type of the message";
		public static const web100Details:String = "Web100 Detailed Analysis";
		public static const web100KernelVar:String = "WEB100 Kernel Variables";
		public static const web100Stats:String = "WEB100 Enabled Statistics";
		public static const web100Var:String = "Web100 Variables";
		public static const web100rtt:String = "Web100 reports the Round trip time";
		public static const web100tcpOpts:String = "Web100 reports TCP negotiated the optional Performance Settings to:";
		public static const willImprove:String = "will improve performance";
		public static const workstation:String = "Workstation";
		public static const your:String = "Your";
		public static const yourPcHas:String = "Your PC/Workstation has a";
		public static const connectingTo:String = "Connecting to";
		public static const toRunTest:String = "to run test";

	}
	
}