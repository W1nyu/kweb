const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

async function findJS(dir) {
    try {
        const files = await readdir(dir);
        for (const file of files) {
            const fullPath = path.join(dir, file);
            const fileStat = await stat(fullPath);

            if (fileStat.isDirectory()) {
                await findJS(fullPath);
            } else if (path.extname(file) === '.js') {
                console.log(fullPath);
            }
        }
    } catch (error) {
        console.error(error);
    }
}

findJS('test');