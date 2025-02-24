<script setup lang="ts">
import { onMounted } from 'vue'
import * as Blockly from 'blockly/core';
</script>

<template>
  <div class="greetings">
    <div id="blocklyDiv" ref="blocklyDiv" style="height: 720px; width: 1024px;"></div>
  </div>
</template>

<script lang="ts">
  export default
  {
    mounted()
    {
      Blockly.Blocks['upload_pipeline'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Upload Pipeline');
          this.appendStatementInput('Steps')
              .setCheck('STEP')
              .appendField('steps');
          this.setPreviousStatement(false);
          this.setOutput(false);
          this.setNextStatement(false);
          this.setColour(45);
          this.setTooltip('Upload Pipeline node');
        }
      };

      // LoaderData step
      Blockly.Blocks['loader_data'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Load Data');
          this.appendValueInput('Filename')
              .setCheck('String')
              .appendField('filename');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(90);
          this.setTooltip('Load Data: Pipeline node');
        }
      };

      // WriteTable step
      Blockly.Blocks['write_table'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Write Table');
          this.appendValueInput('Filename')
              .setCheck('String')
              .appendField('filename');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(135);
          this.setTooltip('Write Table: Pipeline nodes');
        }
      };

      // Summary step
      Blockly.Blocks['summary'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Summary');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(180);
          this.setTooltip('Summary: Pipeline node');
        }
      };

      // Validater step
      Blockly.Blocks['validater'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Validator');
          this.appendStatementInput('ColumnSpecs')
              .setCheck('COLUMNSPEC')
              .appendField('column specs');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(225);
          this.setTooltip('Validator: Pipeline node');
        }
      };

      // FromLongLong step
      Blockly.Blocks['from_long_long'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('From Long Long to Wide');
          this.appendValueInput('ColumnNameColumnName')
              .setCheck('String')
              .appendField('column name column name');
          this.appendValueInput('RowNameColumnName')
              .setCheck('String')
              .appendField('row name column name');
          this.appendValueInput('ValueColumnName')
              .setCheck('String')
              .appendField('value column name');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(270);
          this.setTooltip('From Long Long to Wide: Pipeline node');
        }
      };

      // ArmadilloUploader step
      Blockly.Blocks['armadillo_uploader'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Armadillo Uploader');
          this.appendValueInput('ArmadilloURL')
              .setCheck('String')
              .appendField('armdillo url');
          this.appendValueInput('Username')
              .setCheck('String')
              .appendField('user name');
          this.appendValueInput('password')
              .setCheck('String')
              .appendField('password');
          this.appendValueInput('ProjectName')
              .setCheck('String')
              .appendField('project name');
          this.appendValueInput('FolderName')
              .setCheck('String')
              .appendField('folder name');
          this.appendValueInput('TableName')
              .setCheck('String')
              .appendField('table name');
          this.setPreviousStatement(true, "STEP");
          this.setOutput(false);
          this.setNextStatement(true, "STEP");
          this.setColour(315);
          this.setTooltip('Armadillo Uploader: Pipeline node');
        }
      };

      Blockly.Blocks['column_spec'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('Column Spec');
          this.appendValueInput('ColumnNameColumnName')
              .setCheck('String')
              .appendField('column name\'s column name');
          this.appendValueInput('RowNameColumnName')
              .setCheck('String')
              .appendField('row name\'s column name');
          this.appendValueInput('ValueColumnName')
              .setCheck('String')
              .appendField('value column\'s name');
          this.setPreviousStatement(true, "COLUMNSPEC");
          this.setOutput(false);
          this.setNextStatement(true, "COLUMNSPEC");
          this.setColour(270);
          this.setTooltip('Column Spec: Validation node');
        }
      };

      Blockly.Blocks['string_input'] =
      {
        init: function()
        {
          this.appendDummyInput()
              .appendField('text input:')
              .appendField(new Blockly.FieldTextInput("default text"), 'FIELDNAME');
          this.setOutput(true, "String");
          this.setColour(30);
        }
      };

      const workspace = Blockly.inject(this.$refs.blocklyDiv, {toolbox: 
        {
          "kind": 'categoryToolbox',
          "contents":
          [
            {
              "kind": "category",
              "name": "Structures",
              "contents":
              [
                {
                  "kind": "block",
                  "type": "upload_pipeline"
                }
              ]
            },
            {
              "kind": "category",
              "name": "Steps",
              "contents":
              [
                {
                  "kind": "block",
                  "type": "loader_data"
                },
                {
                  "kind": "block",
                  "type": "write_table"
                },
                {
                  "kind": "block",
                  "type": "summary"
                },
                {
                  "kind": "block",
                  "type": "validater"
                },
                {
                  "kind": "block",
                  "type": "from_long_long"
                },
                {
                  "kind": "block",
                  "type": "armadillo_uploader"
                }
              ]
            },
            {
              "kind": "category",
              "name": "Checks",
              "contents":
              [
                {
                  "kind": "block",
                  "type": "column_spec"
                }
              ]
            },
            {
              "kind": "category",
              "name": "Values",
              "contents":
              [
                {
                  "kind": "block",
                  "type": "string_input"
                }
              ]
            }
          ]
        }
      });
    }
  }
</script>

<style scoped>
h1 {
  font-weight: 500;
  font-size: 2.6rem;
  position: relative;
  top: -10px;
}

.greetings h1,
.greetings h3 {
  text-align: center;
}
</style>
