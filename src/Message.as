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
  import flash.net.Socket;
  import flash.utils.ByteArray;
  
  /**
   * Class to define an NDT message. A message is characterized by a type,
   * a length and a body. All the types are defined in the class MessageType.
   * All the valid types are defined in the class MessageType.
   * The client and server exchange messages as sequence of bytes, where
   * - the 1st byte contains the type of a message,
   * - the 2nd and 3rd bytes contain the length of the message.
   */
  public class Message {
    // TODO: Find out why type_ cannot be initialized to MessageType.UNDEF_TYPE.
    private var type_:int;
    private var length_:int = 0;
    private var body_:ByteArray;

    public function get type():int {
      return type_;
    }
    public function get length():int {
      return length_;
    }
    public function get body():ByteArray {
      return body_;
    
    }
    public static function getBody(intToSend:int): ByteArray {
      var body:ByteArray = new ByteArray();
      // TODO: Verify if writeInteger should be used instead.
      body.writeByte(intToSend);
      return body;
    }
    public static function createHeader(type:int, length:int):ByteArray {
      var header:ByteArray = new ByteArray();
      header[0] = type;
      header[1] = (length >> 8);
      header[2] = length;
      return header;
    }

    private function readHeader(socket:Socket):Boolean {
      var header:ByteArray = new ByteArray();
      if (NDTUtils.readBytes(socket, header, 0,
                             NDTConstants.MSG_HEADER_LENGTH) !=
          NDTConstants.MSG_HEADER_LENGTH) {
        return false;
      }
      type_ = header[0]
      length_ = (int(header[1]) & 0xFF) << 8;
      length_ += int(header[2]) & 0xFF;
      return true;
    }

    /**
     * Read bytes from the protocol socket.
     * @param {int}  Number of bytes to read.
     * @return {int} Number of bytes read.
     */
     private function readBody(socket:Socket, bytesToRead:int):int {
       body_ = new ByteArray();
       var bytesRead:int = 0;
       var currentBytesRead:int;
       while (bytesRead != bytesToRead) {
         currentBytesRead = NDTUtils.readBytes( 
             socket, body_, bytesRead, bytesToRead - bytesRead);
         if (currentBytesRead <= 0) {
           // end of file 
           break;
         }
         bytesRead += currentBytesRead;
       }
       return bytesRead;
     }

    /**
     * Receive message.
     * @return {int} Values:
     *   a) NDTConstants.PROTOCOL_MSG_READ_SUCCESS, in case of success.
                             successfully read expected number of bytes.
     *   b) NDTConstants.PROTOCOL_MSG_READ_ERROR, if it cannot read the message
            header or if the message body is shorther than expected. 
     */
    public function receiveMessage(socket:Socket,
                                   kickOldClientsMsg:Boolean=false):int {
      if (kickOldClientsMsg) {
        if (readBody(socket, NDTConstants.KICK_OLD_CLIENTS_MSG_LENGTH) !=
            NDTConstants.KICK_OLD_CLIENTS_MSG_LENGTH) {
          return NDTConstants.PROTOCOL_MSG_READ_ERROR;
        } else {
          return NDTConstants.PROTOCOL_MSG_READ_SUCCESS;
        }
      }
      if (!readHeader(socket) || (readBody(socket, length) != length)) {
        return NDTConstants.PROTOCOL_MSG_READ_ERROR;
      }
      return NDTConstants.PROTOCOL_MSG_READ_SUCCESS;
    }

     /**
      * Send protocol messages given their type and data byte array
      * @param {int} bParamType Control Message Type
      * @param {ByteArray} bParamToSend Data value array to send
      */
     public static function sendMessage(
         socket:Socket, type:int, body:ByteArray):void {
       socket.writeBytes(createHeader(type, body.length));
       socket.writeBytes(body);
       socket.flush();
      }
  }
}

