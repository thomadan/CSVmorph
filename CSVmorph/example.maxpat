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
		"rect" : [ 153.0, 80.0, 996.0, 612.0 ],
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
					"id" : "obj-12",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 236.0, 91.0, 201.0, 34.0 ],
					"style" : "",
					"text" : "Turn on audio, since CSVmorph operates in the signal domain."
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 16.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 352.0, 13.0, 283.0, 25.0 ],
					"style" : "",
					"text" : "Demonstration of the CSVmorph patch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 236.0, 478.0, 201.0, 34.0 ],
					"style" : "",
					"text" : "The output is a signal value in the range of 0 - 1."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 445.0, 478.0, 56.0, 22.0 ],
					"sig" : 0.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 236.0, 321.0, 201.0, 48.0 ],
					"style" : "",
					"text" : "A second instance of CSVmorph is getting input from the first, controlling its Low-pass filter setting."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 236.0, 160.0, 201.0, 20.0 ],
					"style" : "",
					"text" : "Click on CSVmorph to maximize it."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 445.0, 91.0, 45.0, 45.0 ],
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
					"id" : "obj-34",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 445.0, 160.0, 84.0, 22.0 ],
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
					"id" : "obj-13",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "CSVmorph.maxpat",
					"numinlets" : 9,
					"numoutlets" : 1,
					"offset" : [ 0.0, -300.0 ],
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 445.0, 321.0, 84.0, 22.0 ],
					"varname" : "CSVmorph",
					"viewvisibility" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-34::obj-88" : [ "live.toggle[18]", "live.toggle", 0 ],
			"obj-13::obj-88" : [ "live.toggle[1]", "live.toggle", 0 ],
			"obj-34::obj-103" : [ "live.toggle[19]", "live.toggle", 0 ],
			"obj-13::obj-97" : [ "live.toggle", "live.toggle", 0 ],
			"obj-13::obj-103" : [ "live.toggle[2]", "live.toggle", 0 ],
			"obj-34::obj-17" : [ "live.toggle[16]", "live.toggle", 0 ],
			"obj-34::obj-97" : [ "live.toggle[17]", "live.toggle", 0 ],
			"obj-13::obj-17" : [ "live.toggle[3]", "live.toggle", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "CSVmorph.maxpat",
				"bootpath" : "C:/Users/thoma/Dropbox/Max/CSVmorph",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "CSVmorphResize.js",
				"bootpath" : "C:/Users/thoma/Dropbox/Max/CSVmorph",
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
