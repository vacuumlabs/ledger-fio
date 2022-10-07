import { testStart, testStep, testEnd, getScriptName, getSpeculosDefaultConf } from "./speculos-common.js";
import {getTransport} from "./speculos-transport.js"
import { getButtonsAndSnapshots } from "./speculos-buttons-and-snapshots.js";
import { Fio } from "ledgerjs-hw-app-fio"
import { fileURLToPath } from 'url';
import assert from 'assert/strict';

const scriptName = getScriptName(fileURLToPath(import.meta.url));
testStart(scriptName);

const speculosConf = getSpeculosDefaultConf();
const transport = await getTransport(speculosConf);
const app = new Fio(transport);
const device = getButtonsAndSnapshots(scriptName, speculosConf);

await device.makeStartingScreenshot();

testStep(" - - -", "await app.runTests()");
const {version, compatibility} = await app.getVersion();
assert.equal(version.major, 1)
assert.equal(version.minor, 0)
assert.equal(version.patch, 0)
assert.equal(compatibility.isCompatible, true)
assert.equal(compatibility.recommendedVersion, null)

await transport.close()
testEnd(scriptName);
process.stdin.pause()