import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

	property string bindPrefix
	property BatteryDetails details: BatteryDetails { bindPrefix: root.bindPrefix }
	title: service.description + " | Cell Voltages"

	model: VisualItemModel {

		MbItemRow {
			description: qsTr("Voltages (Min/Max/Diff)")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/Min"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Max"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Diff"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (1/2/3/4)")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/Cell1"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell2"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell3"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell4"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (5/6/7/8)")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/Cell5"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell6"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell7"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell8"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (9/10/11/12)")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/Cell9"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell10"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell11"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell12"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Cells (13/14/15/16)")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/Cell13"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell14"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell15"); } width: 70; height: 25 },
				MbTextBlock { item { bind: service.path("/Voltages/Cell16"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Charge End Voltage")
			values: [
				MbTextBlock { item { bind: service.path("/Info/ChargeEndVoltage"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Discharge End Voltage")
			values: [
				MbTextBlock { item { bind: service.path("/Info/DischargeEndVoltage"); } width: 70; height: 25 }
			]
		}

		MbItemRow {
			description: qsTr("Data Timestamp")
			values: [
				MbTextBlock { item { bind: service.path("/Voltages/UpdateTimestamp"); } width: 215; height: 25 }
			]
		}

	}
}
