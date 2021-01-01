import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

	property string bindPrefix
	property BatteryDetails details: BatteryDetails { bindPrefix: root.bindPrefix }
	title: service.description + " | Cell Impedances"

	model: VisualItemModel {

		MbItemRow {
			id: currentState1
			description: qsTr("Measured Current")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/CurrentMode1"); } height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Current1"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Impedances (Min/Max/Sum)")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/Min"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Max"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Sum"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (1/2/3/4)")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/Cell1"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell2"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell3"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell4"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (5/6/7/8)")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/Cell5"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell6"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell7"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell8"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (9/10/11/12)")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/Cell9"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell10"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell11"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell12"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (13/14/15/16)")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/Cell13"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell14"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell15"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Impedances/Cell16"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Data Timestamp")
			values: [
				MbTextBlock { item { bind: service.path("/Impedances/UpdateTimestamp"); } width: 215; height: 25 }
			]
		}

	}
}
