{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 1,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 0.0, 0.0, 1280.0, 720.0 ],
		"bglocked" : 1,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 15,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "Template Max 7 toolbars hidden",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 973.0, 582.0, 72.0, 22.0 ],
					"style" : "",
					"text" : "fullscreen 0"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-34",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 337.75, 20.0, 486.0, 148.0 ],
					"varname" : "CSVmorph[4]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-38",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 746.375, 182.0, 486.0, 148.0 ],
					"varname" : "CSVmorph[8]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-33",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 688.0, 380.0, 486.0, 148.0 ],
					"varname" : "CSVmorph[3]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1079.0, 635.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-1",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 221.0, 534.0, 486.0, 148.0 ],
					"varname" : "CSVmorph",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-2",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 25.0, 666.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-32",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 596.75, 463.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[2]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-37",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 571.0, 425.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[7]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-48",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 569.75, 308.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[12]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-47",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 545.75, 343.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[11]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-31",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 513.25, 371.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-45",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 396.0, 267.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[9]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-35",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 396.0, 294.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[5]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-36",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 454.0, 334.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[6]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-46",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 486.0, 230.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[10]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-50",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1064.0, 343.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[13]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-51",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1155.0, 343.0, 84.0, 22.0 ],
					"varname" : "CSVmorph[14]",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-34::obj-103" : [ "live.toggle[19]", "live.toggle", 0 ],
			"obj-38::obj-17" : [ "live.toggle[32]", "live.toggle", 0 ],
			"obj-37::obj-88" : [ "live.toggle[30]", "live.toggle", 0 ],
			"obj-47::obj-17" : [ "live.toggle[44]", "live.toggle", 0 ],
			"obj-47::obj-88" : [ "live.toggle[46]", "live.toggle", 0 ],
			"obj-36::obj-97" : [ "live.toggle[25]", "live.toggle", 0 ],
			"obj-48::obj-103" : [ "live.toggle[51]", "live.toggle", 0 ],
			"obj-1::obj-103" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-51::obj-17" : [ "live.toggle[56]", "live.toggle", 0 ],
			"obj-31::obj-17" : [ "live.toggle[4]", "live.toggle", 0 ],
			"obj-34::obj-88" : [ "live.toggle[18]", "live.toggle", 0 ],
			"obj-37::obj-97" : [ "live.toggle[29]", "live.toggle", 0 ],
			"obj-32::obj-103" : [ "live.toggle[11]", "live.toggle", 0 ],
			"obj-35::obj-103" : [ "live.toggle[23]", "live.toggle", 0 ],
			"obj-37::obj-103" : [ "live.toggle[31]", "live.toggle", 0 ],
			"obj-48::obj-88" : [ "live.toggle[50]", "live.toggle", 0 ],
			"obj-45::obj-103" : [ "live.toggle[39]", "live.toggle", 0 ],
			"obj-50::obj-103" : [ "live.toggle[55]", "live.toggle", 0 ],
			"obj-51::obj-103" : [ "live.toggle[59]", "live.toggle", 0 ],
			"obj-34::obj-97" : [ "live.toggle[17]", "live.toggle", 0 ],
			"obj-32::obj-17" : [ "live.toggle[8]", "live.toggle", 0 ],
			"obj-46::obj-103" : [ "live.toggle[43]", "live.toggle", 0 ],
			"obj-35::obj-97" : [ "live.toggle[21]", "live.toggle", 0 ],
			"obj-33::obj-17" : [ "live.toggle[12]", "live.toggle", 0 ],
			"obj-38::obj-103" : [ "live.toggle[35]", "live.toggle", 0 ],
			"obj-36::obj-17" : [ "live.toggle[24]", "live.toggle", 0 ],
			"obj-48::obj-97" : [ "live.toggle[49]", "live.toggle", 0 ],
			"obj-45::obj-88" : [ "live.toggle[38]", "live.toggle", 0 ],
			"obj-50::obj-88" : [ "live.toggle[54]", "live.toggle", 0 ],
			"obj-37::obj-17" : [ "live.toggle[28]", "live.toggle", 0 ],
			"obj-51::obj-88" : [ "live.toggle[58]", "live.toggle", 0 ],
			"obj-34::obj-17" : [ "live.toggle[16]", "live.toggle", 0 ],
			"obj-31::obj-88" : [ "live.toggle[6]", "live.toggle", 0 ],
			"obj-46::obj-88" : [ "live.toggle[42]", "live.toggle", 0 ],
			"obj-1::obj-88" : [ "live.toggle[1]", "live.toggle", 0 ],
			"obj-35::obj-17" : [ "live.toggle[20]", "live.toggle", 0 ],
			"obj-32::obj-88" : [ "live.toggle[10]", "live.toggle", 0 ],
			"obj-38::obj-88" : [ "live.toggle[34]", "live.toggle", 0 ],
			"obj-35::obj-88" : [ "live.toggle[22]", "live.toggle", 0 ],
			"obj-47::obj-103" : [ "live.toggle[47]", "live.toggle", 0 ],
			"obj-45::obj-97" : [ "live.toggle[37]", "live.toggle", 0 ],
			"obj-50::obj-97" : [ "live.toggle[53]", "live.toggle", 0 ],
			"obj-33::obj-88" : [ "live.toggle[14]", "live.toggle", 0 ],
			"obj-36::obj-103" : [ "live.toggle[27]", "live.toggle", 0 ],
			"obj-51::obj-97" : [ "live.toggle[57]", "live.toggle", 0 ],
			"obj-1::obj-17" : [ "live.toggle[3]", "live.toggle", 0 ],
			"obj-46::obj-97" : [ "live.toggle[41]", "live.toggle", 0 ],
			"obj-32::obj-97" : [ "live.toggle[9]", "live.toggle", 0 ],
			"obj-38::obj-97" : [ "live.toggle[33]", "live.toggle", 0 ],
			"obj-47::obj-97" : [ "live.toggle[45]", "live.toggle", 0 ],
			"obj-48::obj-17" : [ "live.toggle[48]", "live.toggle", 0 ],
			"obj-45::obj-17" : [ "live.toggle[36]", "live.toggle", 0 ],
			"obj-33::obj-97" : [ "live.toggle[13]", "live.toggle", 0 ],
			"obj-36::obj-88" : [ "live.toggle[26]", "live.toggle", 0 ],
			"obj-31::obj-97" : [ "live.toggle[5]", "live.toggle", 0 ],
			"obj-1::obj-97" : [ "live.toggle", "live.toggle", 0 ],
			"obj-33::obj-103" : [ "live.toggle[15]", "live.toggle", 0 ],
			"obj-50::obj-17" : [ "live.toggle[52]", "live.toggle", 0 ],
			"obj-46::obj-17" : [ "live.toggle[40]", "live.toggle", 0 ],
			"obj-31::obj-103" : [ "live.toggle[7]", "live.toggle", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "CSVmorph.maxpat",
				"bootpath" : "C:/Users/Thomas/Dropbox/Max/CSVmorph",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "CSVmorphResize.js",
				"bootpath" : "C:/Users/Thomas/Dropbox/Max/CSVmorph",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "mxj~.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0,
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
		"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39
	}

}
