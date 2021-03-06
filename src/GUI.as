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
  import flash.display.Graphics;
  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.*;
  import flash.display.Sprite;
  import flash.events.MouseEvent;
  import flash.ui.Mouse;
  import flash.events.Event;
  import flash.net.*;
  import flash.display.DisplayObjectContainer;
  import flash.display.DisplayObject;
  import flash.filters.BlurFilter;
  import spark.effects.*;

  /**
   * This class creates a Flash GUI for the client. The GUI is optional and can
   * be disabled in the 'Main' class.
   */
  public class GUI extends Sprite {
    [Embed(source="../assets/mlab-logo.png")]
    private var MLabLogoImg:Class;

    private var _stageWidth:int;
    private var _stageHeight:int;
    private var _callerObj:NDTPController;

    private var _mlabLogo:DisplayObject;
    private var _aboutNDTText:TextField;
    private var _learnMoreLink:Sprite;
    private var _urlRequest:URLRequest;
    private var _startButton:Sprite;

    private var _consoleText:TextField;
    private var _resultsTextField:TextField;
    private var _summaryResultText:String;
    private var _resultsButton:Sprite;
    private var _detailsButton:Sprite;
    private var _errorsButton:Sprite;
    private var _debugButton:Sprite;

    public function GUI(
        stageWidth:int, stageHeight:int, callerObj:NDTPController) {
      _stageWidth  = stageWidth;
      _stageHeight = stageHeight;
      _callerObj = callerObj;

      // Create objects of the initial screen.
      // 1) M-Lab logo
      _mlabLogo = new MLabLogoImg();

      // 2) About NDT
      var aboutNDTTextFormat:TextFormat = new TextFormat();
      aboutNDTTextFormat.size = 14;
      aboutNDTTextFormat.font = "Verdana";
      aboutNDTTextFormat.align = TextFormatAlign.CENTER;
      aboutNDTTextFormat.color = 0x000000;
      _aboutNDTText = new TextField();
      _aboutNDTText.defaultTextFormat = aboutNDTTextFormat;
      _aboutNDTText.width = 0.75 * _stageWidth;
      _aboutNDTText.height = 0.40 * _stageHeight;
      _aboutNDTText.wordWrap = true;
      _aboutNDTText.selectable = false;
      _aboutNDTText.text = "Network Diagnostic Tool (NDT) provides a "
                           + "sophisticated speed and diagnostic test. An NDT "
                           + "test reports more than just the upload and "
                           + "download speeds — it also attempts to determine "
                           + "what, if any, problems limited these speeds, "
                           + "differentiating between computer configuration "
                           + "and network infrastructure problems. While the "
                           + "diagnostic messages are most useful for expert "
                           + "users, they can also help novice users by "
                           + "allowing them to provide detailed trouble "
                           + "reports to their network administrator.";

      // 3) Learn more link
      _urlRequest = new URLRequest(NDTConstants.MLAB_SITE);
      var learnMoreTextFormat:TextFormat = new TextFormat();
      learnMoreTextFormat.size = 14;
      learnMoreTextFormat.font = "Verdana";
      learnMoreTextFormat.underline = true;
      learnMoreTextFormat.align = TextFormatAlign.CENTER;
      learnMoreTextFormat.color = 0x000000;
      var learnMoreText:TextField = new TextField();
      learnMoreText.defaultTextFormat = learnMoreTextFormat;
      learnMoreText.text = "Learn more about Measurement Lab";
      _learnMoreLink = new Sprite();
      _learnMoreLink.addChild(learnMoreText);
      _learnMoreLink.buttonMode = true;
      _learnMoreLink.mouseChildren = false;
      _learnMoreLink.width = 0.50 * _stageWidth;

      // 4) Start button
      _startButton = new NDTButton("START", 30, 45, 0.4);

      // Position objects within initial screen, using a relative layout.
      _mlabLogo.x = (_stageWidth / 2) - (_mlabLogo.width / 2);
      _aboutNDTText.x = _stageWidth / 2 - _aboutNDTText.width / 2;
      _learnMoreLink.x = _stageWidth / 2 - _learnMoreLink.width / 2;
      _startButton.x = _stageWidth / 2;
      var verticalMargin:Number = (_stageHeight - (
          _mlabLogo.height + _aboutNDTText.height + _learnMoreLink.height
          + _startButton.height)) / 5;
      _mlabLogo.y = verticalMargin;
      _aboutNDTText.y = _mlabLogo.y + _mlabLogo.height + verticalMargin;
      _learnMoreLink.y = _aboutNDTText.y + _aboutNDTText.height;
                         + verticalMargin;
      _startButton.y = _learnMoreLink.y + _learnMoreLink.height
                         + verticalMargin;

      // Add initial event listeners.
      _learnMoreLink.addEventListener(MouseEvent.CLICK, clickLearnMoreLink);
      _startButton.addEventListener(MouseEvent.ROLL_OVER, rollOver);
      _startButton.addEventListener(MouseEvent.ROLL_OUT, rollOut);
      _startButton.addEventListener(MouseEvent.CLICK, clickStart);

      // Add objects to the initial screen.
      this.addChild(_mlabLogo);
      this.addChild(_aboutNDTText);
      this.addChild(_learnMoreLink);
      this.addChild(_startButton);
    }

    private function clickLearnMoreLink(e:MouseEvent):void {
      try {
        navigateToURL(_urlRequest);
      } catch (error:Error) {
        TestResults.appendErrMsg(error.toString());
      }
    }

    private function rollOver(e:MouseEvent):void {
      e.target.alpha = 0.8;
    }

    private function rollOut(e:MouseEvent):void {
      e.target.alpha = 1;
    }

    private function clickStart(e:MouseEvent):void {
      hideInitialScreen();
      _consoleText = new ResultsTextField();
      _consoleText.scrollV = 0;
      _consoleText.x = 0.02 * _stageWidth;
      _consoleText.y = 0.02 * _stageHeight;
      _consoleText.width = 0.96 * _stageWidth;
      _consoleText.height = 0.96 * _stageHeight;
      this.addChild(_consoleText);
      _callerObj.startNDTTest();
    }

    private function hideInitialScreen():void {
      while (this.numChildren > 0)
        this.removeChildAt(0);

      _learnMoreLink.removeEventListener(MouseEvent.CLICK, clickLearnMoreLink);
      _startButton.removeEventListener(MouseEvent.ROLL_OVER, rollOver);
      _startButton.removeEventListener(MouseEvent.ROLL_OUT, rollOut);
      _startButton.removeEventListener(MouseEvent.CLICK, clickStart);
    }

    /**
     * Add text to the console while the NDT test is running.
     */
    public function addConsoleOutput(text:String):void {
      _consoleText.appendText(text);
      _consoleText.scrollV++;
    }

    private function hideConsoleScreen():void {
      while (this.numChildren)
        this.removeChildAt(0);
    }

    public function displayResults():void {
      hideConsoleScreen();

      var resultsRect:Sprite = new Sprite();
      resultsRect.x = 0.25 * _stageWidth;
      resultsRect.graphics.beginFill(0);
      resultsRect.graphics.drawRect(0, 0, 0.75 *_stageWidth, _stageHeight);
      resultsRect.graphics.endFill();
      resultsRect.alpha = 0.125;
      var blur:BlurFilter = new BlurFilter(16.0, 0, 1);
      resultsRect.filters = [blur];
      this.addChild(resultsRect);

      _resultsTextField = new ResultsTextField();
      _resultsTextField.x = 0.275 * _stageWidth;
      _resultsTextField.y = 0.05 * _stageHeight;
      _resultsTextField.width = 0.725 * _stageWidth;
      _resultsTextField.height = 0.90 * _stageHeight;
      this.addChild(_resultsTextField);

      _resultsButton = new NDTButton("RESULTS", 18, 30, 0.25);
      _detailsButton = new NDTButton("DETAILS", 18, 30, 0.25);
      _errorsButton = new NDTButton("ERRORS", 18, 30, 0.25);
      if (CONFIG::debug)
        _debugButton = new NDTButton("DEBUG", 18, 30, 0.25);

      var verticalMargin:Number = _stageHeight / 4;
      if (CONFIG::debug)
        verticalMargin = _stageHeight / 5;
      _resultsButton.y = verticalMargin;
      _detailsButton.y = _resultsButton.y + verticalMargin;
      _errorsButton.y = _detailsButton.y  + verticalMargin;
      _debugButton.y = _errorsButton.y + verticalMargin;
      _resultsButton.x += _resultsButton.width / 2;
      _detailsButton.x += _detailsButton.width / 2;
      _errorsButton.x += _errorsButton.width / 2;
      _debugButton.x += _debugButton.width / 2;

      this.addChild(_resultsButton);
      this.addChild(_detailsButton);
      this.addChild(_errorsButton);
      if (_debugButton)
        this.addChild(_debugButton);

      _resultsButton.addEventListener(MouseEvent.ROLL_OVER, rollOver);
      _detailsButton.addEventListener(MouseEvent.ROLL_OVER, rollOver);
      _errorsButton.addEventListener(MouseEvent.ROLL_OVER, rollOver);
      if (_debugButton)
        _debugButton.addEventListener(MouseEvent.ROLL_OVER, rollOver);

      _resultsButton.addEventListener(MouseEvent.ROLL_OUT, rollOut);
      _detailsButton.addEventListener(MouseEvent.ROLL_OUT, rollOut);
      _errorsButton.addEventListener(MouseEvent.ROLL_OUT, rollOut);
      if (_debugButton)
        _debugButton.addEventListener(MouseEvent.ROLL_OUT, rollOut);

      _resultsButton.addEventListener(MouseEvent.CLICK, clickResults);
      _detailsButton.addEventListener(MouseEvent.CLICK, clickDetails);
      _errorsButton.addEventListener(MouseEvent.CLICK, clickErrors);
      if (_debugButton)
        _debugButton.addEventListener(MouseEvent.CLICK, clickDebug);

      setSummaryResultText();
      _resultsTextField.htmlText = _summaryResultText;
    }

    private function setSummaryResultText():void {
      _summaryResultText = new String();
      _summaryResultText = (
          "<p><font size=\"16\">" + "NDT test run towards M-Lab server<br>"
          + "<b>" + Main.server_hostname + "</b></font><br><br>");

      if (TestResults.ndt_test_results::ndtVariables[NDTConstants.MINRTT]) {
        _summaryResultText += (
          "<p><font size=\"16\">" + "RTT between client and M-Lab server<br>"
          + "<p><font size=\"30\">"
          + TestResults.ndt_test_results::ndtVariables[NDTConstants.MINRTT]
          + "</font> ms</font><br><br>");
      }

      if ((TestResults.ndt_test_results::testsConfirmedByServer & TestType.S2C)
          == TestType.S2C) {
        if (!TestResults.ndt_test_results::s2cTestSuccess)
          _summaryResultText += (
              "<p><font size=\"18\" color=\"#FF0000\">"
              + "Download test FAILED! View Errors for details.</font>");
        else {
          // Print results in the most convinient units.
          _summaryResultText += (
              "<p><font size=\"16\">" + "DOWNLOAD SPEED<br>");
          if (TestResults.ndt_test_results::s2cSpeed < 1.0)
            _summaryResultText += (
              "<p><font size=\"30\">"
              + TestResults.ndt_test_results::s2cSpeed.toFixed(1)
              + "</font> kbps</font><br><br>");
          else
            _summaryResultText += (
            "<p><font size=\"30\">"
            + (TestResults.ndt_test_results::s2cSpeed / 1000).toFixed(1)
            + "</font> Mbps</font><br><br>");
        }
      }
      if ((TestResults.ndt_test_results::testsConfirmedByServer & TestType.C2S)
          == TestType.C2S) {
        if (!TestResults.ndt_test_results::c2sTestSuccess)
          _summaryResultText += (
              "<p><font size=\"18\" color=\"#FF0000\">"
              + "Upload test FAILED! View Errors for details.</font>");
        else {
          // Print results in the most convinient units.
          _summaryResultText += (
              "<p><fonit size=\"16\">" + "UPLOAD SPEED<br>");
          if (TestResults.ndt_test_results::c2sSpeed < 1.0)
            _summaryResultText += (
              "<p><font size=\"30\">"
              + TestResults.ndt_test_results::c2sSpeed.toFixed(1)
              + "</font> kbps</font><br><br>");
          else
            _summaryResultText += (
            "<p><font size=\"30\">"
            + (TestResults.ndt_test_results::c2sSpeed / 1000).toFixed(1)
            + "</font> Mbps</font><br><br>");
        }
      }
    }

    private function clickResults(e:MouseEvent):void {
      _resultsTextField.htmlText = _summaryResultText;
      _resultsTextField.scrollV = 0;
   }

    private function clickDetails(e:MouseEvent):void {
      _resultsTextField.htmlText = "<font size=\"14\">"
                                   + TestResults.getResultDetails();
      _resultsTextField.scrollV = 0;
    }

    private function clickDebug(e:MouseEvent):void {
      _resultsTextField.htmlText = "<font size=\"14\">"
                                   + TestResults.getDebugMsg();
      _resultsTextField.scrollV = 0;
    }

    private function clickErrors(e:MouseEvent):void {
      _resultsTextField.htmlText = "<font size=\"14\">"
                                   + TestResults.getErrMsg();
      _resultsTextField.scrollV = 0;
    }
  }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.*;

class NDTButton extends Sprite {
  [Embed(source="../assets/hover.png")]
  private var ButtonImg:Class;

  function NDTButton(text:String, textSize:int, height:int, prop:Number) {
    super();
    this.buttonMode = true;

    var textFormat:TextFormat = new TextFormat();
    textFormat.size = textSize;
    textFormat.font = "Verdana";
    textFormat.bold = true;
    textFormat.align = TextFormatAlign.CENTER;
    textFormat.color = 0xFFFFFF;
    var textField:TextField = new TextField();
    textField.defaultTextFormat = textFormat;
    textField.text = text;

    var buttonShape:DisplayObject = new ButtonImg();

    buttonShape.width *= prop;
    buttonShape.height *= prop;
    buttonShape.x -= buttonShape.width / 2;
    buttonShape.y -= buttonShape.height / 2;
    textField.width = buttonShape.width;
    textField.height = height;
    textField.x -= textField.width / 2;
    textField.y -= textField.height / 2;

    this.addChild(buttonShape);
    this.addChild(textField);
    this.mouseChildren = false;
  }
}

class ResultsTextField extends TextField {
  public function ResultsTextField() {
    super();
    this.wordWrap = true;
    this.multiline = true;
    this.antiAliasType = flash.text.AntiAliasType.ADVANCED;
    var textFormat:TextFormat = new TextFormat();
    textFormat.size = 14;
    textFormat.font = "Verdana";
    textFormat.color = 0x000000;
    textFormat.align = TextFormatAlign.LEFT;
    this.defaultTextFormat = textFormat;
  }
}

